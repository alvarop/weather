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

#if MYNEWT_VAL(USE_BLE)
#include <host/ble_hs.h>
#endif

#include "sysinit/sysinit.h"
#include "os/os.h"
#include "bsp/bsp.h"
#include "hal/hal_gpio.h"

/* Define task stack and task object */
#define WEATHER_TASK_PRI         (10) 
#define WEATHER_STACK_SIZE       (256) 
struct os_task weather_task; 
os_stack_t weather_task_stack[WEATHER_STACK_SIZE]; 

#define BEACON_MAGIC 0xDA7A

typedef struct {
    int16_t magic;
    uint16_t timestamp;
    int16_t temperature;
    int16_t light;
    float pressure;
    uint16_t wind;
    uint16_t rain;
} __attribute__((packed)) weather_beacon_t;

#if MYNEWT_VAL(USE_BLE)
weather_beacon_t beacon_data;

static void ble_app_advertise();

static void ble_app_set_addr(void) {
    ble_addr_t addr;
    int rc;

    rc = ble_hs_id_gen_rnd(1, &addr);
    assert(rc == 0);

    rc = ble_hs_id_set_rnd(addr.val);
    assert(rc == 0);
}

static int bleprph_gap_event(struct ble_gap_event *event, void *arg) {
    switch (event->type) {
    case BLE_GAP_EVENT_ADV_COMPLETE:
        ble_app_advertise();
        return 0;
    }

    console_printf("Other event: %d\n", event->type);
    return 0;
}


static void ble_app_advertise() {
    struct ble_gap_adv_params adv_params;
    struct ble_hs_adv_fields fields;
    int rc;

    fields = (struct ble_hs_adv_fields){ 0 };
    rc = ble_eddystone_set_adv_data_uid(&fields, &beacon_data);
    assert(rc == 0);

    adv_params = (struct ble_gap_adv_params){ 0 };
    rc = ble_gap_adv_start(BLE_OWN_ADDR_RANDOM, NULL, 1000,
                           &adv_params, bleprph_gap_event, NULL);
    assert(rc == 0);
}

static void ble_app_on_sync(void) {
    /* Generate a non-resolvable private address. */
    ble_app_set_addr();

    /* Advertise indefinitely. */
    ble_app_advertise();
}
#endif

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

        beacon_data.temperature = (int16_t)(data.temperature * 100);
        beacon_data.pressure = data.pressure;

    } else {
        console_printf("Error reading from BMP280\n");
    }
}

void weather_task_func(void *arg) {

    console_printf("Weather Breakout!\n");

    hal_gpio_init_out(LED_BLINK_PIN, 1);

#if MYNEWT_VAL(USE_BLE)
    beacon_data.magic = 0xDA7A;
    beacon_data.timestamp = 0;
    beacon_data.temperature = 0;
    beacon_data.light = 0;
    beacon_data.pressure = 0.0;
    beacon_data.wind = 0;
    beacon_data.rain = 0;
#endif

    struct adc_dev *adc;

    adc = adc_init();

    windrain_init(adc);
    temt6000_init(adc);

    while (1) {
        os_time_delay(OS_TICKS_PER_SEC * 5);

        print_bmp_data();

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

#if MYNEWT_VAL(USE_BLE)
     ble_hs_cfg.sync_cb = ble_app_on_sync;
#endif

    while (1) {
        os_eventq_run(os_eventq_dflt_get());
    }
    assert(0);
    return rc;
}
