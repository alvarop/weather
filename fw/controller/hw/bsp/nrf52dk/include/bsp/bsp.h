/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

#ifndef H_BSP_H
#define H_BSP_H

#include <inttypes.h>

#include <syscfg/syscfg.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Define special stackos sections */
#define sec_data_core   __attribute__((section(".data.core")))
#define sec_bss_core    __attribute__((section(".bss.core")))
#define sec_bss_nz_core __attribute__((section(".bss.core.nz")))

/* More convenient section placement macros. */
#define bssnz_t         sec_bss_nz_core

extern uint8_t _ram_start;
#define RAM_SIZE        0x10000

#define LED0           (20)
#define LED1           (19)
#define LED2           (18)
#define LED3           (17)
#define LED_BLINK_PIN   (LED0)

#define SPI_SCK (12)
#define SPI_MISO (13)
#define SPI_MOSI (14)
#define SPI_CS0 (16)
#define SPI_CS1 (15)

#define I2C_SDA (27)
#define I2C_SCL (26)

#define UART_TX (11)
#define UART_RX (10)

#define WX_WDIR (5)
#define WX_WDIR_AIN (3)
#define WX_WDIR_SAADC NRF_SAADC_INPUT_AIN3

#define WX_WSPEED (6)
#define WX_RAIN (7)

#define WX_LIGHT (4)
#define WX_LIGHT_AIN (2)
#define WX_LIGHT_SAADC NRF_SAADC_INPUT_AIN2

#ifdef __cplusplus
}
#endif

#endif  /* H_BSP_H */
