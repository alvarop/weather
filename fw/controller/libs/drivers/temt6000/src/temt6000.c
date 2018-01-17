#include <console/console.h>
#include <hal/hal_gpio.h>
#include <assert.h>
#include <adc/adc.h>
#include <myadc/myadc.h>
#include "bsp.h"

static struct adc_dev *adc;

int16_t temt6000_read() {
    int light_level = 0;
    adc_chan_read(adc, WX_LIGHT_AIN, &light_level);

    if(light_level < 0) {
        light_level = 0;
    }

    return (uint16_t)light_level;
}

void temt6000_init(struct adc_dev *adc_dev) {
    adc = adc_dev;

    adc_init_ch(adc, WX_LIGHT_AIN, WX_LIGHT_SAADC);
}
