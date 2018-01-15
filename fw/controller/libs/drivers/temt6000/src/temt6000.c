#include <shell/shell.h>
#include <console/console.h>
#include <hal/hal_gpio.h>
#include <assert.h>
#include <adc/adc.h>
#include <myadc/myadc.h>
#include "bsp.h"

static struct adc_dev *adc;

/* The timer callout */
static struct os_callout light_callout;

#define LIGHT_PERIOD (1 * OS_TICKS_PER_SEC)

int32_t temt6000_read() {
    int light_level = 0;
    adc_chan_read(adc, WX_LIGHT_AIN, &light_level);

    if(light_level < 0) {
        light_level = 0;
    }

    return (uint32_t)light_level;
}

// Print out current light level
static void temt6000_ev_cb(struct os_event *ev)
{
    assert(ev != NULL);

    uint32_t light_level = temt6000_read();
    console_printf("Light %ld\n", light_level);

    os_callout_reset(&light_callout, LIGHT_PERIOD);
}

void temt6000_init(struct adc_dev *adc_dev) {
    adc = adc_dev;

    adc_init_ch(adc, WX_LIGHT_AIN, WX_LIGHT_SAADC);

    os_callout_init(&light_callout, os_eventq_dflt_get(),
                    temt6000_ev_cb, NULL);

    os_callout_reset(&light_callout, LIGHT_PERIOD);
}
