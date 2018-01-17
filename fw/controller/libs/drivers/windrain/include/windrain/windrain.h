#ifndef _WINDRAIN_H_
#define _WINDRAIN_H_
#include <adc/adc.h>

void windrain_init(struct adc_dev *adc_dev);
uint16_t windrain_get_rain();
uint16_t windrain_get_speed();
int16_t windrain_get_dir();

#endif /* _WINDRAIN_H_ */
