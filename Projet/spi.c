/* 
 * File:    spi.c
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
#include "spi.h"


/******************************/
/***** FONCTIONS GLOBALES *****/
/******************************/
/**
 * 
 */
void SPI_Initialize(void){
    //SPI setup
    SSP2STAT = 0x00;
    SSP2CON1 = 0x31;
    //SSP2CON2 = 0x00;
    //SSP2ADD = 0x01;
    //TRISDbits.TRISD4=0; //SDO (SPI Out) en sortie
    TRIS_MOSI = 0;
    //TRISDbits.TRISD6=0; //SCK (SPI Clock) en sortie
    TRIS_SCK = 0;
    
    TRISFbits.TRISF7 = 0; // CS EEPROM en sortie
    CS_EE = 1;
    PIR2bits.SSP2IF = 0;
    
    SSP2CON1bits.SSPEN = 1;
}


/**
 * 
 * @param data
 * @return 
 */
uint8_t SPI_ExchangeByte(uint8_t data){
    SSP2BUF = data;
    while(!PIR2bits.SSP2IF);
    PIR2bits.SSP2IF = 0;
    return SSP2BUF;
}


/**
 * 
 * @param block
 * @param blockSize
 */
void SPI_ExchangeBlock(void *block, size_t blockSize){
    uint8_t *data = block;
    while(blockSize--)
    {
        SSP2BUF = *data;
        while(!PIR2bits.SSP2IF);
        PIR2bits.SSP2IF = 0;
        *data++ = SSP2BUF;
    }
}

// Half Duplex SPI Functions
/**
 * 
 * @param block
 * @param blockSize
 */
void SPI_WriteBlock(void *block, size_t blockSize){
    uint8_t *data = block;
    while(blockSize--)
    {
        SPI_ExchangeByte(*data++);
    }
}

/**
 * 
 * @param block
 * @param blockSize
 */
void SPI_ReadBlock(void *block, size_t blockSize){
    uint8_t *data = block;
    while(blockSize--)
    {
        *data++ = SPI_ExchangeByte(0);
    }
}

/**
 * 
 * @param byte
 */
void SPI_WriteByte(uint8_t byte){
    SSP2BUF = byte;
}

/**
 * 
 * @return 
 */
uint8_t SPI_ReadByte(void){
    return SSP2BUF;
}
