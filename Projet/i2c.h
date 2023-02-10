/* 
 * File:    i2c.h
 * Author:  Aksel BROSSARD
 *          Marion ESCOUTELOUP
 *          Rafael SOLLARI
 *          Thomas JAMET
 * 
 * GitHub : marionesc
 *
 * Created on 6 février 2023
 */

#ifndef I2C_H
#define	I2C_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <xc.h>
#include "main.h"

void I2C_Initialize(void);

void I2C_Write_Register(uint8_t u8Address, uint8_t u8Register, uint8_t u8Value);

uint8_t I2C_Read_Register(uint8_t u8Address, uint8_t u8Register);

void I2C_Read_Registers(uint8_t u8Address, uint8_t u8FirstRegister, uint8_t u8NbRegister, uint8_t *pu8Values);

#ifdef	__cplusplus
}
#endif

#endif	/* I2C_H */

