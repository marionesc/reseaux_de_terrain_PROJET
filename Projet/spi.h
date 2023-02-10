/* 
 * File:    spi.h
 * Author:  Aksel BROSSARD
 *          Marion ESCOUTELOUP
 *          Rafael SOLLARI
 *          Thomas JAMET
 * 
 * GitHub : marionesc
 *
 * Created on 6 février 2023
 */

#ifndef SPI_H
#define SPI_H

#include <xc.h>
#include "main.h"

void SPI_Initialize(void);

uint8_t SPI_ExchangeByte(uint8_t data);

void SPI_ExchangeBlock(void *block, size_t blockSize);

// Half Duplex SPI Functions
void SPI_WriteBlock(void *block, size_t blockSize);

void SPI_ReadBlock(void *block, size_t blockSize);

void SPI_WriteByte(uint8_t byte);

uint8_t SPI_ReadByte(void);

#ifdef	__cplusplus
}
#endif

#endif //SPI_H