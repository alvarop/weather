#ifndef _TEMT6000_H_
#define _TEMT6000_H_
#include <adc/adc.h>

void temt6000_init(struct adc_dev *adc_dev);
int16_t temt6000_read();

#endif /* _TEMT6000_H_ */
