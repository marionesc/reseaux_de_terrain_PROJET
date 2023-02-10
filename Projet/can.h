/* 
 * File:    can.h
 * Author:  Aksel BROSSARD
 *          Marion ESCOUTELOUP
 *          Rafael SOLLARI
 *          Thomas JAMET
 * 
 * GitHub : marionesc
 *
 * Created on 6 février 2023
 */


#define CAN_SPI_COMMAND_WRITE       0x02
#define CAN_SPI_COMMAND_READ        0x03

#define CAN_SPI_STATUS_REGISTER     0x0E
#define CAN_SPI_CONTROL_REGISTER    0x0F

void CAN_SPI_Configure(void);
uint8_t CAN_SPI_ReadRegisterByte(uint8_t Fu8RegisterAddress);
void CAN_SPI_WriteRegisterByte(uint8_t Fu8RegisterAddress, uint8_t Fu8Data);
uint8_t CAN_SPI_ReadStatusRegister(void);
uint8_t CAN_SPI_ReadOperationMode(void);
void CAN_SPI_SetNormalOperationMode(void);