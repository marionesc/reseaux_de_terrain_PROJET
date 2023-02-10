/* 
 * File:    OneWire.c
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
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


#include "oneWire.h"
#include "afficheur.h"

/******************************/
/***** VARIABLES GLOBALES *****/
/******************************/
#define ONE_WIRE_PORT 1
#define ONE_WIRE_TRIS 1
#define ONE_WIRE_PIN 1


#define _XTAL_FREQ 11059200
/******************************/
/***** FONCTIONS GLOBALES *****/
/******************************/
/**
 * 
 */
uint8_t Start_OneWire(void){
    TRIS_DSIO = 0;      //Port C5 en sortie TRISCbits.TRISC5
    DSIO_O = 0;         // Ecriture de 0 pulse de reset
    __delay_us(500);    // peut etre definir XtalFreq
    TRIS_DSIO = 1;      //Port C5 en entrée TRISCbits.TRISC5
    __delay_us(100);    //delais entre fin emission du bit et reponse composent
    if (DSIO_I ==0)     //Port C5 en lecture en attente de reponse composant
        {
            __delay_us(400);    //attendre fin de sequence reset avant de changer de fonction
            return 1;           // composent present
        }
    return 0;   // composent absent
}

/**
 * 
 * @param value
 */
void Write_bit_OneWire(uint8_t VAL){
   DSIO_O = 0;  
   TRIS_DSIO = 0;    // configure DS18B20_PIN pin as output  tRIS_DSIO   TRISCbits.TRISC5
  __delay_us(2);
  DSIO_O  = ( (VAL)&(0x01) );
  __delay_us(80);       // wait 80 us

  TRIS_DSIO = 1;  // configure DS18B20_PIN pin as input
  __delay_us(2);        // wait 2 us
}

/**
 * 
 * @return 
 */
uint8_t Read_bit_OneWire(void){
  static uint8_t value;

  DSIO_O = 0;
  TRIS_DSIO = 0;  // configure DS18B20_PIN pin as output
  __delay_us(2);

  TRIS_DSIO = 1;  // configure DS18B20_PIN pin as input
  __delay_us(5);        // wait 5 us

  value = DSIO_O;  // read and store DS18B20 state
  __delay_us(100);      // wait 100 us

  return value;
}
