#include <stdint.h>
#include <shell/shell.h>
#include <console/console.h>
#include <assert.h>
#include <i2c/i2c.h>
#include <os/os_cputime.h>

#define AM2315_ADDR 0x5C

static int am2315_shell_func(int argc, char **argv);
static struct shell_cmd am2315_cmd = {
    .sc_cmd = "am2315",
    .sc_cmd_func = am2315_shell_func,
};

int32_t am2315_init() {
    int rc;

    rc = shell_cmd_register(&am2315_cmd);

    assert(rc == 0);

    return 0;
}

int32_t am2315_read() {
    uint8_t wbuff[3];
    uint8_t rbuff[8];
    uint32_t rval;

    wbuff[0] = 0;

    // Wake up the device
    rval = i2c(0, AM2315_ADDR, 1, wbuff, 0, NULL, 10);
    if(rval) {
        console_printf("rval1 = %ld\n", rval);
        i2c_init(0, 27, 26, I2C_FREQ_100K);
        // console_printf("i2c init %d\n", rc);
    }

    wbuff[0] = 3;
    wbuff[1] = 0;
    wbuff[2] = 4;

    os_cputime_delay_usecs(900);

    rval = i2c(0, AM2315_ADDR, 4, wbuff, 0, NULL, 10);
    if(rval) {
        console_printf("rval2 = %ld\n", rval);
        i2c_init(0, 27, 26, I2C_FREQ_100K);
        // console_printf("i2c init %d\n", rc);
    }

    // Wait 10ms for sample
    os_cputime_delay_usecs(10000);

    rval = i2c(0, AM2315_ADDR, 0, NULL, sizeof(rbuff), rbuff, 10);
    if(rval) {
        console_printf("rval3 = %ld\n", rval);
        i2c_init(0, 27, 26, I2C_FREQ_100K);
        // console_printf("i2c init %d\n", rc);
    }

    return 0;
}

static int am2315_shell_func(int argc, char **argv) {

    console_printf("AM2315 Read!\n");
    am2315_read();

    return 0;
}
