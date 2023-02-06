/* 
 * File:   afficheur.h
 * Author: Franck
 *
 * Created on 29 janvier 2018, 10:19
 */

#ifndef AFFICHEUR_H
#define	AFFICHEUR_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <xc.h>
#include "main.h"

            // Commandes afficheur
#define     SET_CURSOR_POINTER  0x21
#define     SET_OFFSET_REGISTER 0x22
#define     SET_ADDRESS_POINTER 0x24

#define     SET_TEXT_HOME_ADDRESS       0x40
#define     SET_TEXT_AREA               0x41
#define     SET_GRAPHIC_HOME_ADDRESS    0x42
#define     SET_GRAPHIC_AREA            0x43


// Constante
#define     NB_COL_GRAPH        40

// Prototypes
    void write_d_aff(unsigned char data);
    void write_c_aff(unsigned char command);
    unsigned char check_status_ok(void);
    unsigned char wait_status_ok(void);
    unsigned char command(unsigned char cmd);
    unsigned char d1command(unsigned char d1, unsigned char cmd);
    unsigned char d2command(unsigned char d1, unsigned char d2, unsigned char cmd);
    void delai_us_char(unsigned char ucdelai);
    void initialisation_afficheur(void);
    void draw_char(unsigned char dccar);
    void draw_string(unsigned char * tableau);
    void draw_hex8(unsigned char octet);
    void goto_lico(unsigned char ligne, unsigned char colonne);
    void clear_text(void);
    void clear_graphics(void);
    void clear_cgram(void);
    void plot1(unsigned char x, unsigned char y);
    void plot0(unsigned char x, unsigned char y);
    void drawVericalLine(unsigned char ligne, unsigned char colonne, unsigned char lenght);



#ifdef	__cplusplus
}
#endif

#endif	/* AFFICHEUR_H */

