#include <shell/shell.h>
#include <console/console.h>
#include <hal/hal_gpio.h>
#include <assert.h>
#include <adc/adc.h>
#include <myadc/myadc.h>
#include "bsp.h"

int16_t windrain_get_dir();

static int windrain_shell_func(int argc, char **argv);
static struct shell_cmd windrain_cmd = {
    .sc_cmd = "wr",
    .sc_cmd_func = windrain_shell_func,
};

typedef struct {
    uint16_t voltage;
    uint16_t direction;
} wind_dir_t;

static struct adc_dev *adc;

static uint32_t speed_ticks;
static uint32_t last_speed_ticks;
static uint32_t wind_speed;

static uint32_t rain_ticks;
static uint32_t last_rain_ticks;
static uint32_t rain;

/* The timer callout */
static struct os_callout wind_speed_callout;
static struct os_callout rain_callout;

#define WIND_DIR_ADC_CH 3

#define WIND_SPEED_PIN 06
#define RAIN_PIN 07

#define WIND_SPEED_PERIOD (10 * OS_TICKS_PER_SEC)

#define RAIN_PERIOD (60 * OS_TICKS_PER_SEC)

// Lookup table to get wind direction from voltage
// Auto-generated with winddircalc.py
// VDD3.30= R_PU=4700 R_S=2000
static const wind_dir_t wind_dir_lut[] = {
    {1229, 1125},
    {1271, 675},
    {1337, 900},
    {1472, 1575},
    {1640, 1350},
    {1780, 2025},
    {1984, 1800},
    {2195, 225},
    {2407, 450},
    {2586, 2475},
    {2687, 2250},
    {2833, 3375},
    {2946, 0},
    {3033, 2925},
    {3131, 3150},
    {3384, 2700},
    {0 ,0}};

static void windrain_print_info() {
    uint16_t direction = windrain_get_dir();

    console_printf( "ws: %ld.%ld kph @ %d.%d\n",
                        wind_speed/1000,
                        wind_speed - (wind_speed/1000) * 1000,
                        direction/10,
                        direction - (direction/10) * 10);
}

// Periodic function that computes and updates wind speed
static void wind_speed_ev_cb(struct os_event *ev)
{
    assert(ev != NULL);

    static uint32_t last_wind_speed = UINT32_MAX;

    if (last_speed_ticks != speed_ticks) {
        uint32_t ticks;
        ticks = speed_ticks - last_speed_ticks;
        last_speed_ticks = speed_ticks;

        wind_speed = ticks * 2400 / (WIND_SPEED_PERIOD / OS_TICKS_PER_SEC);
    } else {
        wind_speed = 0;
    }

    if(wind_speed != last_wind_speed) {
        windrain_print_info();
        last_wind_speed = wind_speed;
    }

    os_callout_reset(&wind_speed_callout, WIND_SPEED_PERIOD);
}

// Periodic function that computes and updates wind speed
static void rain_ev_cb(struct os_event *ev)
{
    assert(ev != NULL);

    static uint32_t last_rain = UINT32_MAX;

    if (last_rain_ticks != rain_ticks) {
        uint32_t ticks;
        ticks = rain_ticks - last_rain_ticks;
        last_rain_ticks = rain_ticks;

        // 0.2794 mm of rain per tick
        rain = ticks * 2794;
    } else {
        rain = 0;
    }

    if(rain != last_rain) {
        console_printf("rain: %ld.%ld mm\n", rain/10000, rain - (rain/10000) * 10000);
        last_rain = rain;
    }


    os_callout_reset(&rain_callout, RAIN_PERIOD);
}

static void wind_speed_irq(void *arg) {
    // TODO - add debounce
    speed_ticks++;
}

static void rain_irq(void *arg) {
    static os_time_t last_rain_time;
    if(os_time_get() != last_rain_time) {
        console_printf("RAIN!\n");
        last_rain_time = os_time_get();
        rain_ticks++;
    }
}

void windrain_init(struct adc_dev *adc_dev) {
    int rc;
    adc = adc_dev;

    rc = shell_cmd_register(&windrain_cmd);

    assert(rc == 0);

    adc_init_ch(adc, WX_WDIR_AIN, WX_WDIR_SAADC);

    os_callout_init(&wind_speed_callout, os_eventq_dflt_get(),
                    wind_speed_ev_cb, NULL);

    os_callout_reset(&wind_speed_callout, WIND_SPEED_PERIOD);

    os_callout_init(&rain_callout, os_eventq_dflt_get(),
                    rain_ev_cb, NULL);

    os_callout_reset(&rain_callout, RAIN_PERIOD);

    hal_gpio_irq_init(WIND_SPEED_PIN, wind_speed_irq, NULL,
        HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_UP);

    hal_gpio_irq_init(RAIN_PIN, rain_irq, NULL,
        HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_UP);

    hal_gpio_irq_enable(WIND_SPEED_PIN);
    hal_gpio_irq_enable(RAIN_PIN);
}

int16_t windrain_get_dir() {
    int mv = 0;
    int16_t direction = -1;

    adc_chan_read(adc, WIND_DIR_ADC_CH, &mv);
    mv = adc_result_mv(adc, WIND_DIR_ADC_CH, mv);
    // console_printf("%dmv\n", mv);

    for (uint8_t dir = 0; dir < sizeof(wind_dir_lut)/sizeof(wind_dir_t); dir++) {
        if (mv < wind_dir_lut[dir].voltage) {
            direction = wind_dir_lut[dir].direction;
            break;
        }

        // TODO add invalid check
    }

    return direction;
}

static int windrain_shell_func(int argc, char **argv) {

    os_time_t now = os_time_get();
    console_printf("Time: %ld\n", now);
    windrain_print_info();

    return 0;
}