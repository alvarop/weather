#include <assert.h>
#include <os/os.h>

/* ADC */
#include "myadc/myadc.h"
#include "nrf.h"
#include "app_util_platform.h"
#include "app_error.h"
#include <adc/adc.h>
#include <adc_nrf52/adc_nrf52.h>
#include "nrf_drv_saadc.h"
#include <console/console.h>

#define ADC_NUMBER_SAMPLES (2)
#define ADC_NUMBER_CHANNELS (1)

nrf_drv_saadc_config_t adc_config = NRF_DRV_SAADC_DEFAULT_CONFIG;

static struct adc_dev os_bsp_adc0;
static nrf_drv_saadc_config_t os_bsp_adc0_config = {
    .resolution         = MYNEWT_VAL(ADC_0_RESOLUTION),
    .oversample         = MYNEWT_VAL(ADC_0_OVERSAMPLE),
    .interrupt_priority = MYNEWT_VAL(ADC_0_INTERRUPT_PRIORITY),
};
void *
adc_init(void)
{
    int rc = 0;
    struct adc_dev *adc;

    rc = os_dev_create((struct os_dev *) &os_bsp_adc0, "adc0",
            OS_DEV_INIT_KERNEL, OS_DEV_INIT_PRIO_DEFAULT,
            nrf52_adc_dev_init, &os_bsp_adc0_config);
    assert(rc == 0);

    adc = (struct adc_dev *) os_dev_open("adc0", 0, &adc_config);
    assert(adc != NULL);

    return adc;
}

int adc_init_ch(struct adc_dev *adc, uint8_t ch, nrf_saadc_input_t saadc_in) {
    if (adc == NULL) {
        return -1;
    } else {

        // Channel config pin is ch + 1
        nrf_saadc_channel_config_t cc = \
            NRF_DRV_SAADC_DEFAULT_CHANNEL_CONFIG_SE(saadc_in);
        cc.gain = NRF_SAADC_GAIN1_6;
        cc.reference = NRF_SAADC_REFERENCE_INTERNAL;

        return adc_chan_config(adc, ch, &cc);
    }
}
