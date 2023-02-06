/* 
 * File:   main.h
 * Author: Franck
 *
 * Created on 29 janvier 2018, 10:15
 */

#ifndef MAIN_H
#define	MAIN_H

#ifdef	__cplusplus
extern "C" {
#endif


    
// Include de base
#include <xc.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
    
// Include du projet

    
        /* Configuration du PIC:
    Oscillateur: HS (12MHz)
    Watchdog Timer: désactivé
    Protection du code: désactivé */
#pragma config CONFIG1L = 0x15 //RC0 et RC1 actif
#pragma config CONFIG1H = 0x13 //HS1_OSC (4-16MHz) with pllx4 12MHz x 4 = 48MHz
#pragma config CONFIG2L = 0x61 //BOR et PWRT Disable
#pragma config CONFIG2H = 0x00 //WDT off
#pragma config CONFIG3L = 0x30 //0x30:Bus D:8bit A:8bit RTCC => LFINTOSC
#pragma config CONFIG3H = 0x80 //MCLR
#pragma config CONFIG4L = 0x81 //0x81=debug_off 0x01=DEBUG_ON
#pragma config CONFIG5L = 0xFF //No CODE PROTECT
#pragma config CONFIG5H = 0xC0 //No CP EEPROM + code
#pragma config CONFIG6L = 0xFF //No write protect...
#pragma config CONFIG6H = 0xE0 //No write protect config...
#pragma config CONFIG7L = 0xFF //No table read protection
#pragma config CONFIG7H = 0x40 //No table read protection

    // Défintion des broches

//PORTA
#define     BOTTOM      LATAbits.LATA0
#define     LEFT        LATAbits.LATA1
#define     LED1    LATAbits.LATA2
#define     LED2    LATAbits.LATA3
#define     LED3    LATAbits.LATA4
#define     LED4    LATAbits.LATA5

//PORTB
#define     INT_CAN         PORTBbits.RB0
#define     RX0BF           PORTBbits.RB1
#define     RX1BF           PORTBbits.RB2
#define     INT_8583        PORTBbits.RB3
#define     PULSE           PORTBbits.RB4
#define     MMC_CD          PORTBbits.RB5
#define     PGC             PORTBbits.RB6
#define     PGD             PORTBbits.RB7

//PORTC
#define     MMC_CS      PORTCbits.RC0
#define     LED_G       LATCbits.LATC1
#define     LED_R       LATCbits.LATC2
#define     SCL         PORTCbits.RC3
#define     TRIS_SCL    TRISCbits.TRISC3
#define     SDA         PORTCbits.RC4
#define     TRIS_SDA    TRISCbits.TRISC4    
#define     DSIO_O      LATCbits.LATC5
#define     DSIO_I      PORTCbits.RC5
#define     TRIS_DSIO   TRISCbits.TRISC5
#define     TRIS_RX     TRISCbits.TRISC6
#define     TRIS_TX     TRISCbits.TRISC7


//PORTD
#define     BP1         PORTDbits.RD0
#define     BP2         PORTDbits.RD1
#define     BP3         PORTDbits.RD2
#define     BP4         PORTDbits.RD3
#define     TRIS_MOSI   TRISDbits.TRISD4
#define     TRIS_MISO   TRISDbits.TRISD5
#define     TRIS_SCK    TRISDbits.TRISD6
#define     CLKOUT      PORTDbits.RD7

//PORTE
#define     RA_8588     PORTEbits.RE0
#define     RB_8588     PORTEbits.RE1
#define     RESET_CAN   LATEbits.LATE2
#define     TX0RTS      LATEbits.LATE3
#define     TX1RTS      LATEbits.LATE4
#define     TX2RTS      LATEbits.LATE5
#define     STDBY       LATEbits.LATE6
#define     CS_MCP2515  LATEbits.LATE7

//PORTF
#define     SLP15       LATFbits.LATF1
#define     TX0_8585    LATFbits.LATF2
#define     TX1_8585    LATFbits.LATF3
#define     TESTA       LATFbits.LATF4
#define     TESTB       LATFbits.LATF5
#define     TRIS_VPOT   TRISFbits.TRISF6
#define     CS_EE       LATFbits.LATF7

//PORTG
#define     LED_B       LATGbits.LATG0
#define     TRIS_TX2    TRISGbits.TRISG1
#define     TRIS_RX2    TRISGbits.TRISG2
#define     DRIVEA      LATGbits.LATG3
#define     DRIVEB      LATGbits.LATG4

//PORTH
// Bus de donnée afficheur GLCD

//PORTJ
#define     GLCD_CD     LATJbits.LATJ0
#define     GLCD_RD     LATJbits.LATJ1
#define     GLCD_WR     LATJbits.LATJ2
#define     GLCD_CE     LATJbits.LATJ3
#define     GLCD_RES    LATJbits.LATJ4
#define     GLCD_MD     LATJbits.LATJ5
#define     GLCD_FS     LATJbits.LATJ6
#define     BUZZER      LATJbits.LATJ7

// Definition des canaux analogiques

#define     TOUCHPAD_X          0
#define     TOUCHPAD_Y          1
#define     POTENTIO_10K        11

    
    


#ifdef	__cplusplus
}
#endif

#endif	/* MAIN_H */

