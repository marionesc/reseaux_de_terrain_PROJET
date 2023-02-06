/* 
 * File:    i2c.c
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
#include "i2c.h"



/******************************/
/***** FONCTIONS GLOBALES *****/
/******************************/
/**
 * 
 */
void I2C_Initialize(void){
    SSP1STAT = 0x00;
    SSP1CON1 = 0x00;
    SSP1CON1bits.SSPM = 0x08;   // 1000 = I2C Master mode
    SSP1CON2 = 0x00;
    SSP1ADD = 0x77;             // Baud rate pour I2C à 100kHz
    SSP1CON1bits.SSPEN = 1;     // Enables the serial port and configures the SDAx and SCLx pins as the serial port pins
}


/**
 * 
 * @param u8Address
 * @param u8Register
 * @param u8Value
 */
void I2C_Write_Register(uint8_t u8Address, uint8_t u8Register, uint8_t u8Value){
    SSP1CON2bits.SEN = 1;               // Envoi du bit de start
    while(SSP1CON2bits.SEN){}           // Attente de la fin du bit de start
    
    SSP1BUF = u8Address;                // Envoi de l'adresse I2C du chip (esclave) avec lequel communiquer
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag utilisé dans la gesion de l'i2c pour l'envoi/reception des octets et des acquittements
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi de l'adresse
    while(SSP1CON2bits.ACKSTAT == 1){}; // Attente de l'acquittement de l'esclave
    
    SSP1BUF = u8Register;               // Envoi du registre à écrire
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi du registre
    while(SSP1CON2bits.ACKSTAT == 1){}; // Attente de l'acquittement de l'esclave
    
    SSP1BUF = u8Value;                  // Envoi de la valeur à écrire dans le registre
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
     
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi de la valeur
    while(SSP1CON2bits.ACKSTAT == 1){}; // Attente de l'acquittement de l'esclave
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    SSP1CON2bits.PEN = 1;               // Envoi du bit de stop
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi du bit de stop
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
}

/**
 * 
 * @param u8Address
 * @param u8Register
 * @return 
 */
uint8_t I2C_Read_Register(uint8_t u8Address, uint8_t u8Register){
    uint8_t u8Value = 0;                // Variable pour lire la valeur du registre
    
    // Envoi à l'esclave du numéro du registre que l'on veut lire
    SSP1CON2bits.SEN = 1;               // Envoi du bit de start
    while(SSP1CON2bits.SEN){}           // Attente de la fin du bit de start
    
    SSP1BUF = u8Address;                // Envoi de l'adresse I2C du chip (esclave) avec lequel communiquer
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag utilisé dans la gesion de l'i2c pour l'envoi/reception des octets et des acquittements
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi de l'adresse
    while(SSP1CON2bits.ACKSTAT == 1){}; // Attente de l'acquittement de l'esclave
    
    SSP1BUF = u8Register;               // Envoi du registre à lire
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi du registre
    while(SSP1CON2bits.ACKSTAT == 1){}; // Attente de l'acquittement de l'esclave
    
    // Passage à la lecture du registre
    SSP1CON2bits.SEN = 1;               // Envoi du bit de start
    while(SSP1CON2bits.SEN){}           // Attente de la fin du bit de start
    
    SSP1BUF = u8Address + 1;            // Envoi de l'adresse I2C en lecture du chip (esclave)
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi de l'adresse
    while(SSP1CON2bits.ACKSTAT == 1){}; // Attente de l'acquittement de l'esclave
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    SSP1CON2bits.RCEN = 1;              //Configuration du maitre en receveur
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la reception de l'octet envoyé par l'esclave
    u8Value = SSP1BUF;                  // Lecture de la donnée recue
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
      
    SSP1CON2bits.ACKDT = 1;             // Configuration du non acquittement de la reception pour stopper la communication
    SSP1CON2bits.ACKEN = 1;             // Lancement de la sequence d'acquittement
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin du non acquittement
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    SSP1CON2bits.PEN = 1;               // Envoi du bit de stop
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi du bit de stop
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    return u8Value;                     // Retour de la valeur du registre
}


/**
 * 
 * @param u8Address
 * @param u8FirstRegister
 * @param u8NbRegister
 * @param pu8Values
 */
void I2C_Read_Registers(uint8_t u8Address, uint8_t u8FirstRegister, uint8_t u8NbRegister, uint8_t *pu8Values){
    uint8_t u8Cpt = 0;                  // Compteur pour gérer le nombre de registres à lire
    
    // Envoi à l'esclave du numéro du premier registre que l'on veut lire
    SSP1CON2bits.SEN = 1;               // Envoi du bit de start
    while(SSP1CON2bits.SEN){}           // Attente de la fin du bit de start
    
    SSP1BUF = u8Address;                // Envoi de l'adresse I2C du chip (esclave) avec lequel communiquer
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag utilisé dans la gesion de l'i2c pour l'envoi/reception des octets et des acquittements
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi de l'adresse
    while(SSP1CON2bits.ACKSTAT == 1){}; // Attente de l'acquittement de l'esclave
    
    SSP1BUF = u8FirstRegister;          // Envoi du premier registre à lire
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi du registre
    while(SSP1CON2bits.ACKSTAT == 1){}; // Attente de l'acquittement de l'esclave
    
    // Passage à la lecture des registres
    SSP1CON2bits.SEN = 1;               // Envoi du bit de re start
    while(SSP1CON2bits.SEN){}           // Attente de la fin du bit de start
    
    SSP1BUF = u8Address + 1;            // Envoi de l'adresse I2C en lecture du chip (esclave)
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi de l'adresse
    while(SSP1CON2bits.ACKSTAT == 1){}; // Attente de l'acquittement de l'esclave
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    SSP1CON2bits.RCEN = 1;              // Configuration du maitre en receveur
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la reception de l'octet envoyé par l'esclave
    *pu8Values = SSP1BUF;               // Lecture de la donnée recue
    
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    // Répétition, lecture des données envoyées par l'esclave
    for(u8Cpt=1; u8Cpt<u8NbRegister; u8Cpt++){
        SSP1CON2bits.ACKDT = 0;         // Configuration de l'acquittement de la reception
        SSP1CON2bits.ACKEN = 1;         // Lancement de la sequence d'acquittement du précédent octet reçu

        while(PIR1bits.SSP1IF == 0){}   // Attente de la fin de l'acquittement
        SSP1CON2bits.RCEN = 1;          // Configuration du maitre en receveur
        
        PIR1bits.SSP1IF = 0;            // Mise à 0 du flag

        while(PIR1bits.SSP1IF == 0){}   // Attente de la reception de l'octet envoyé par l'esclave
        *(pu8Values+u8Cpt) = SSP1BUF;   // Lecture de la donnée recue
        
        PIR1bits.SSP1IF = 0;            // Mise à 0 du flag
    }
   
    SSP1CON2bits.ACKDT = 1;             // Configuration du non acquittement de la reception pour stopper la communication
    SSP1CON2bits.ACKEN = 1;             // Lancement de la sequence d'acquittement
    
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin du non acquittement
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
    
    SSP1CON2bits.PEN = 1;               // Envoi du bit de stop
    while(PIR1bits.SSP1IF == 0){}       // Attente de la fin de l'envoi du bit de stop
    PIR1bits.SSP1IF = 0;                // Mise à 0 du flag
}