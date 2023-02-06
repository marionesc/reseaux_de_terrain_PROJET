#ifndef EEP_SPI_H
#define EEP_SPI_H

#include <xc.h>
#include "main.h"
#include "spi.h"

void EEP_SPI_Initialize(void);

void EEP_SPI_EnableWrite(void);

bool EEP_SPI_IsWriteInProgress(void);

uint8_t EEP_SPI_ReadByte(uint8_t Fu8Address);

void EEP_SPI_WriteByte(uint8_t Fu8Address, uint8_t Fu8Data);

void EEP_SPI_WriteBytes(uint8_t Fu8Address, uint8_t *Fpu8Data, uint8_t Fu8Size);


#endif //EEP_SPI_H