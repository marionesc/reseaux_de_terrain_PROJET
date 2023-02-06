/* 
 * File:    eep_spi.c
 * Author:  Aksel BROSSARD
 *          Marion ESCOUTELOUP
 *          Rafael SOLLARI
 *          Thomas JAMET
 * 
 * GitHub : marionesc
 *
 * Created on 6 février 2023
 */

/*******************************/
/***** LIBRARIES UTILISEES *****/
/*******************************/
#include <xc.h>
#include "eep_spi.h"


/******************************/
/***** FONCTIONS GLOBALES *****/
/******************************/
/**
 * 
 */
void EEP_SPI_Initialize(void){
}

/**
 * 
 */
void EEP_SPI_EnableWrite(void){
    CS_EE = 0;
    (void)SPI_ExchangeByte(0x06); // Enable write (WREN)
    CS_EE = 1;
}

/**
 * 
 * @return 
 */
bool EEP_SPI_IsWriteInProgress(void){
    uint8_t u8WIP = 0x00;

    CS_EE = 0;
    (void)SPI_ExchangeByte(0x05);
    u8WIP = SPI_ExchangeByte(0x00)&0x01;
    CS_EE = 1;
    
    if(0 != u8WIP)
    {
        return(true);
    }
    else
    {
        return(false);
    }
}

/**
 * 
 * @param Fu8Address
 * @return 
 */
uint8_t EEP_SPI_ReadByte(uint8_t Fu8Address){
    uint8_t u8ReadData = 0x00;

    // Wait if EEPROM is writing a data
    while(EEP_SPI_IsWriteInProgress());

    // Read EEPROM data
    CS_EE = 0;
    SPI_ExchangeByte(0x03);
    SPI_ExchangeByte(Fu8Address);
    u8ReadData = SPI_ExchangeByte(0x00);
    CS_EE = 1;

    return(u8ReadData);
}

/**
 * 
 * @param Fu8Address
 * @param Fu8Data
 */
void EEP_SPI_WriteByte(uint8_t Fu8Address, uint8_t Fu8Data){
    uint8_t tu8Data[3] = {0x02, Fu8Address, Fu8Data};

    // Wait if EEPROM is already writing a data
    while(EEP_SPI_IsWriteInProgress());
    
    // Enable write
    EEP_SPI_EnableWrite();

    // Write data in EEPROM
    CS_EE = 0;
    SPI_ExchangeBlock(&tu8Data, 3);
    CS_EE = 1;
}

/**
 * 
 * @param Fu8Address
 * @param Fpu8Data
 * @param Fu8Size
 */
void EEP_SPI_WriteBytes(uint8_t Fu8Address, uint8_t *Fpu8Data, uint8_t Fu8Size){
    uint8_t u8Index = 0x00;

    for(u8Index=0x00; u8Index<Fu8Size; u8Index++)
    {
        EEP_SPI_WriteByte((Fu8Address+u8Index), *(Fpu8Data+u8Index));
    }
}