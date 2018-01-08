#include <assert.h>
#include <string.h>
#include <shell/shell.h>
#include <console/console.h>
#include <stdio.h>
#include <windrain/windrain.h>
#include <i2c/i2c.h>
#include <sht3x/sht3x.h>

#include "sysinit/sysinit.h"
#include "os/os.h"
#include "bsp/bsp.h"
#include "hal/hal_gpio.h"

static volatile int g_task1_loops;

static struct os_callout led_callout;

static void led_ev_cb(struct os_event *ev)
{
    assert(ev != NULL);

    ++g_task1_loops;
    hal_gpio_toggle(LED_BLINK_PIN);

    os_callout_reset(&led_callout, OS_TICKS_PER_SEC);
}

static void init_timer(void)
{
    os_callout_init(&led_callout, os_eventq_dflt_get(),
                    led_ev_cb, NULL);

    os_callout_reset(&led_callout, OS_TICKS_PER_SEC);

}

int main(int argc, char **argv) {

    int rc;

    sysinit();

    hal_gpio_init_out(LED_BLINK_PIN, 1);
    init_timer();

    windrain_init();

    // rc = i2c_init(0, 27, 26, I2C_FREQ_100K);
    // console_printf("i2c init %d\n", rc);

    // am2315_init();

    // sht3x_init(SHT3x_ADDR);

    while (1) {
        os_eventq_run(os_eventq_dflt_get());
    }
    assert(0);
    return rc;
}
