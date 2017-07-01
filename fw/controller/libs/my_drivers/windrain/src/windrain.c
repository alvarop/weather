#include <shell/shell.h>
#include <console/console.h>
#include <hal/hal_gpio.h>
#include <assert.h>
#include <adc/adc.h>
#include <myadc/myadc.h>

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

/* The timer callout */
static struct os_callout wind_speed_callout;

#define WIND_DIR_ADC_CH 0

#define WIND_SPEED_PIN 28

#define WIND_SPEED_PERIOD (2 * OS_TICKS_PER_SEC)

// Lookup table to get wind direction from voltage
static const wind_dir_t wind_dir_lut[] = {
    {241, 1125},
    {285, 675},
    {354, 900},
    {501, 1575},
    {692, 1350},
    {858, 2025},
    {1117, 1800},
    {1397, 225},
    {1710, 450},
    {1982, 2475},
    {2148, 2250},
    {2399, 3375},
    {2600, 0},
    {2763, 2925},
    {2953, 3150},
    {3252, 2700},
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

static void wind_speed_irq(void *arg) {
    // TODO - add debounce
    speed_ticks++;
}

void windrain_init(void) {
    int rc;

    rc = shell_cmd_register(&windrain_cmd);

    assert(rc == 0);

    adc = adc_init();

    os_callout_init(&wind_speed_callout, os_eventq_dflt_get(),
                    wind_speed_ev_cb, NULL);

    os_callout_reset(&wind_speed_callout, WIND_SPEED_PERIOD);

    hal_gpio_irq_init(WIND_SPEED_PIN, wind_speed_irq, NULL,
        HAL_GPIO_TRIG_RISING, HAL_GPIO_PULL_UP);

    hal_gpio_irq_enable(WIND_SPEED_PIN);
}

int16_t windrain_get_dir() {
    int mv = 0;
    int16_t direction = -1;

    adc_chan_read(adc, WIND_DIR_ADC_CH, &mv);
    mv = adc_result_mv(adc, WIND_DIR_ADC_CH, mv);

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
