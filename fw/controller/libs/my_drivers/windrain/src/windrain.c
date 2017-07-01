#include <shell/shell.h>
#include <console/console.h>
#include <assert.h>
#include <adc/adc.h>
#include <myadc/myadc.h>

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

#define WIND_DIR_ADC_CH 0

static const wind_dir_t dirs[] = {
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


void windrain_init(void) {
    int rc;

    rc = shell_cmd_register(&windrain_cmd);

    assert(rc == 0);

    adc = adc_init();
}

int16_t windrain_get_dir() {
    int mv = 0;
    int16_t direction = -1;

    adc_chan_read(adc, WIND_DIR_ADC_CH, &mv);
    mv = adc_result_mv(adc, WIND_DIR_ADC_CH, mv);

    for (uint8_t dir = 0; dir < sizeof(dirs)/sizeof(wind_dir_t); dir++) {
        if (mv < dirs[dir].voltage) {
            direction = dirs[dir].direction;
            break;
        }

        // TODO add invalid check
    }

    return direction;
}

static int windrain_shell_func(int argc, char **argv) {

    int16_t direction = windrain_get_dir();
    console_printf("Direction: %d.%d\n", direction/10, direction - (direction/10) * 10);

    return 0;
}
