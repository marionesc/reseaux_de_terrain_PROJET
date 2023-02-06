/* 
 * File:    OneWire.h
 * Author:  Aksel BROSSARD & Marion ESCOUTELOUP
 * GitHub : marionesc
 *
 * Created on 6 février 2023, 11:14
 */

#ifndef 1WIRE_H
#define	1WIRE_H



char set_oneWire(unsigned char *VAL, char *Dest);
char set_crc(char *tram1wire);
char get_oneWire(unsigned char VAL, char *Dest);