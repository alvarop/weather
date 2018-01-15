#ifndef _WINDRAIN_H_
#define _WINDRAIN_H_
#include <adc/adc.h>

void windrain_init(struct adc_dev *adc_dev);
int16_t windrain_get_dir();

#endif /* _WINDRAIN_H_ */
