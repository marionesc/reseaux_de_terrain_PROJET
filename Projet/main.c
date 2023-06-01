/* 
 * File:    main.c
 * Author:  Aksel BROSSARD
 *          Marion ESCOUTELOUP
 *          Rafael SOLLARI
 *          Thomas JAMET
 * 
 * GitHub : marionesc
 *
 * Created on 6 février 2023
 */
#include "main.h"
#include "afficheur.h"
#include "spi.h"
#include "eep_spi.h"
#include "i2c.h"
#include "oneWire.h"
#include "can.h"


/*****************************/
/***** VARIABLE GLOBALES *****/
/*****************************/
#define _XTAL_FREQ 11059200
uint8_t u8DataFromI2C = 0;
uint8_t u8Alarme = 0x01;            // Alarme positionner à 126
uint8_t u8EventCounter[3]={0,0,0};

void initialisation_des_ports(){
// Désactivation du bus externe
    MEMCON=0xA0;    //ebdis=1 bus désactivé (sauf en cas d'accès externe)

// Désactivation des fonctions analogiques
    ANCON0=0x03; // ecran tactile en analogique X et Y
    ANCON1=0x08; // AN11 = entrée analogique V_pot
    ANCON2=0x00;


// Valeur initiale des ports en sortie
    LED_R=0;
    LED_G=0;
    LED_B=0;

// Défintion du sens des ports
    TRISAbits.TRISA2=0; //LED1
    TRISAbits.TRISA3=0; //LED2
    TRISAbits.TRISA4=0; //LED3
    TRISAbits.TRISA5=0; //LED4
    TRISCbits.TRISC2=0; //LED_R en sortie
    TRISCbits.TRISC1=0; //LED_G en sortie
    TRISGbits.TRISG0=0; //LED_B en sortie
    TRISCbits.TRISC3=1;
    TRISCbits.TRISC4=1;
   
    TRISDbits.TRISD3=1;
   
    LED4 = 0;

// Mise en place des pull up
    INTCON2bits.RBPU=0; // Pull up PORTB activé
    PADCFG1bits.REPU=1; // Pull up PORTE activé

}



/***********************/
/***** MAIN PROJET *****/
/***********************/
void main(void){
    // INITIALISATION 
    initialisation_des_ports();
    initialisation_afficheur();

    SPI_Initialize();
    EEP_SPI_Initialize();

    I2C_Initialize();

    clear_text();
    clear_graphics();

    goto_lico(0,0);
    draw_string((unsigned char *)"Hello");
   
    I2C_Write_Register(0xA0,0x00,0x20); // Configure i2c chip to event counter
    I2C_Read_Registers(0xA0, 0x01, 3, u8EventCounter);
    
    // BOUCLE INFINI 
    while(1){goto_lico(0,0);
        draw_string((unsigned char *)"Hello");
       
        I2C_Read_Registers(0xA0, 0x01, 3, u8EventCounter);
       
        goto_lico(2,0);
        draw_hex8(u8EventCounter[2]);
        goto_lico(2,2);
        draw_hex8(u8EventCounter[1]);
        goto_lico(2,4);
        draw_hex8(u8EventCounter[0]);
       
        // Sur appui du bouton 4, remise à zéro du cpt (sur 3 octets)
        if(!BP4){
            I2C_Write_Register(0xA0,0x01,0);
            I2C_Write_Register(0xA0,0x02,0);
            I2C_Write_Register(0xA0,0x03,0);

           
            while(!BP4);
        }
       
        u8DataFromI2C = I2C_Read_Register(0xA0, 0x02);
       
        if(u8DataFromI2C >= u8Alarme){
            goto_lico(3,0);
            draw_string("ALARME ! (Passage au dessus de 126)");  
         
         LED4 = 1;
        }
        else{
            draw_string("                                                    ");
        }     
    }
}