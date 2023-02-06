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
#include "oneWire.h"

/******************************/
/***** FONCTIONS GLOBALES *****/
/******************************/
/**
 * Fonction  permettant de réaliser une lecture via le One-Wire
 * @param VAL pointeur sur la chaine de caractere lue
 * @param Dest périphérique de destination
 * @return 0 si OK, sinon 0xFF pour erreur
 */
char set_oneWire(unsigned char *VAL, char *Dest){
    

}

/**
 * Cette fonction permet d'isoler et retourner la valeur de CRC 
 * @param tram1wire la trame complete du bus
 * @return crc_c le CRC du message
 */
char set_crc(char *tram1wire){
    
}
/**
 * Fonction permettant d'ecrire via le one-wire
 * @param VAL valeur à ecrire
 * @param Dest périphérique de destination
 * @return 
 */
char get_oneWire(unsigned char VAL, char *Dest){
    
    
    
}

/**
 * Cette fonction permet d'obtenir la valeur de temperature en [] et de 
 * l'afficher avec un raffraichissement toutes les 30s
 * @param x emplacement (x,y) de la donnee
 * @param y emplacement (x,y) de la donnee
 * @param dest  le périphérique de destination
 */
void set_temperature(char x, char y, char *dest){
    
}
