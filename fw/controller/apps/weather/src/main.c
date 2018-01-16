#include <assert.h>
#include <string.h>
#include <myadc/myadc.h>
#include <console/console.h>
#include <stdio.h>
#include <windrain/windrain.h>
#include <i2c/i2c.h>
#include <sht3x/sht3x.h>
#include <temt6000/temt6000.h>
#include <sensor/sensor.h>
#include <sensor/temperature.h>
#include <sensor/pressure.h>

#include "sysinit/sysinit.h"
#include "os/os.h"
#include "bsp/bsp.h"
#include "hal/hal_gpio.h"

/* Define task stack and task object */
#define WEATHER_TASK_PRI         (OS_TASK_PRI_HIGHEST) 
#define WEATHER_STACK_SIZE       (256) 
struct os_task weather_task; 
os_stack_t weather_task_stack[WEATHER_STACK_SIZE]; 

typedef struct {
    float temperature;
    float pressure;
} bmp280_data_t;

int bmp_read(struct sensor *sensor, void *arg, void *reading,
             sensor_type_t type) {

    int rval = 0;
    bmp280_data_t *data = (bmp280_data_t *)arg;

    if(type == SENSOR_TYPE_AMBIENT_TEMPERATURE) {
        struct sensor_temp_data *temp_data = \
            (struct sensor_temp_data *)reading;
        data->temperature = temp_data->std_temp;
    } else if (type == SENSOR_TYPE_PRESSURE) {
        struct sensor_press_data *pressure_data = \
            (struct sensor_press_data *)reading;
        data->pressure = pressure_data->spd_press;
    } else {
        console_printf("ERR: Unknown type %lld", type);
        rval = -1;
    }

    return rval;
}

void print_bmp_data() {
    bmp280_data_t data = {0.0, 0.0};

    struct sensor *sensor;
    sensor = sensor_mgr_find_next_bydevname("bmp280_0", NULL);
    assert(sensor);
    int rc = sensor_read(
        sensor, 
        SENSOR_TYPE_AMBIENT_TEMPERATURE|SENSOR_TYPE_PRESSURE,
        bmp_read,
        &data,
        OS_TIMEOUT_NEVER);

    if (rc == 0) {
        int int_part = (int)(data.temperature * 100)/100;
        int frac_part = (int)((data.temperature - int_part) * 100);
        
        console_printf("Temperature: %d.%dC\n", int_part, frac_part);

        int_part = (int)(data.pressure/1000.0 * 100000)/100000;
        frac_part = (int)((data.pressure/1000.0 - int_part) * 100000);
        
        console_printf("Pressure: %d.%dkPa\n", int_part, frac_part);
    } else {
        console_printf("Error reading from BMP280\n");
    }
}

void weather_task_func(void *arg) {

    console_printf("Weather Breakout!\n");

    hal_gpio_init_out(LED_BLINK_PIN, 1);

    struct adc_dev *adc;

    adc = adc_init();

    windrain_init(adc);
    temt6000_init(adc);

    while (1) {
        print_bmp_data();

        os_time_delay(OS_TICKS_PER_SEC);

        hal_gpio_toggle(LED_BLINK_PIN);
    }
}

int main(int argc, char **argv) {

    int rc;

    sysinit();

    os_task_init(
        &weather_task,
        "weather_task",
        weather_task_func,
        NULL,
        WEATHER_TASK_PRI,
        OS_WAIT_FOREVER,
        weather_task_stack,
        WEATHER_STACK_SIZE);

    while (1) {
        os_eventq_run(os_eventq_dflt_get());
    }
    assert(0);
    return rc;
}
