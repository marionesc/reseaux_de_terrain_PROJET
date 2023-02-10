/* 
 * File:    can.c
 * Author:  Aksel BROSSARD
 *          Marion ESCOUTELOUP
 *          Rafael SOLLARI
 *          Thomas JAMET
 * 
 * GitHub : marionesc
 *
 * Created on 6 février 2023
 */

#include "can.h"
#include "main.h"

/**
 * 
 */
void CAN_SPI_Configure(void){
    
}

/**
 * 
 * @param Fu8RegisterAddress
 * @return 
 */
uint8_t CAN_SPI_ReadRegisterByte(uint8_t Fu8RegisterAddress){
    uint8_t u8ReadData = 0x00;

    // Read register data
    CS_MCP2515 = 0;
    SPI_ExchangeByte(CAN_SPI_COMMAND_READ);
    SPI_ExchangeByte(Fu8RegisterAddress);
    u8ReadData = SPI_ExchangeByte(0x00);
    CS_MCP2515 = 1;

    return(u8ReadData);
}

void CAN_SPI_WriteRegisterByte(uint8_t Fu8RegisterAddress, uint8_t Fu8Data){
    uint8_t tu8Data[3] = {CAN_SPI_COMMAND_WRITE, Fu8RegisterAddress, Fu8Data};

    // Write data in register
    CS_MCP2515 = 0;
    SPI_ExchangeBlock(&tu8Data, 3);
    CS_MCP2515 = 1;
}

uint8_t CAN_SPI_ReadStatusRegister(void){
    return(CAN_SPI_ReadRegisterByte(CAN_SPI_STATUS_REGISTER));
}

uint8_t CAN_SPI_ReadOperationMode(void){
    return((CAN_SPI_ReadStatusRegister()>>5)&0x07);
}

void CAN_SPI_SetNormalOperationMode(void){
    CAN_SPI_WriteRegisterByte(CAN_SPI_CONTROL_REGISTER,0x00);
}