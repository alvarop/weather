#include <console/console.h>
#include <hal/hal_gpio.h>
#include <assert.h>
#include <adc/adc.h>
#include <myadc/myadc.h>
#include "bsp.h"

int16_t windrain_get_dir();

typedef struct {
    uint16_t voltage;
    uint16_t direction;
} wind_dir_t;

static struct adc_dev *adc;

static uint32_t speed_ticks;
static int64_t last_speed_time_s;

static uint32_t rain_ticks;

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


static void wind_speed_irq(void *arg) {
    // TODO - add debounce
    speed_ticks++;
}

static void rain_irq(void *arg) {
    static os_time_t last_rain_time;
    // Use OS time for debounce (1/128 ~= 8ms)
    if(os_time_get() != last_rain_time) {
        last_rain_time = os_time_get();
        rain_ticks++;
    }
}

uint16_t windrain_get_rain() {
    uint16_t rain = 0;

    // 0.2794 mm of rain per tick
    rain = rain_ticks * 2794;

    rain_ticks = 0;

    return rain;
}

uint16_t windrain_get_speed() {
    uint32_t wind_speed;
    struct os_timeval tv;
    int rval = os_gettimeofday(&tv, NULL);
    assert(rval == 0);

    if (last_speed_time_s < tv.tv_sec) {
        // 1 tick/s is equivalent to 2.4kph
        wind_speed = speed_ticks * 2400 / (tv.tv_sec - last_speed_time_s);
    } else {
        wind_speed = 0;
    }

    speed_ticks = 0;
    last_speed_time_s = tv.tv_sec;

    return (uint16_t) wind_speed;
}

int16_t windrain_get_dir() {
    int mv = 0;
    int16_t direction = -1;

    adc_chan_read(adc, WX_WDIR_AIN, &mv);
    mv = adc_result_mv(adc, WX_WDIR_AIN, mv);

    for (uint8_t dir = 0; dir < sizeof(wind_dir_lut)/sizeof(wind_dir_t); dir++) {
        if (mv < wind_dir_lut[dir].voltage) {
            direction = wind_dir_lut[dir].direction;
            break;
        }

        // TODO add invalid check
    }

    return direction;
}

void windrain_init(struct adc_dev *adc_dev) {

    adc = adc_dev;

    last_speed_time_s = 0;

    adc_init_ch(adc, WX_WDIR_AIN, WX_WDIR_SAADC);

    hal_gpio_irq_init(WX_WSPEED, wind_speed_irq, NULL,
        HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_UP);

    hal_gpio_irq_init(WX_RAIN, rain_irq, NULL,
        HAL_GPIO_TRIG_FALLING, HAL_GPIO_PULL_UP);

    hal_gpio_irq_enable(WX_WSPEED);
    hal_gpio_irq_enable(WX_RAIN);
}
