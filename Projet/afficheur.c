/* 
 * File:    afficheur.C
 * Author:  Aksel BROSSARD
 *          Marion ESCOUTELOUP
 *          Rafael SOLLARI
 *          Thomas JAMET
 * 
 * GitHub : marionesc
 *
 * Created on 6 f�vrier 2023
 */

/*******************************/
/***** LIBRARIES UTILISEES *****/
/*******************************/
#include <xc.h>
#include "afficheur.h"


/******************************/
/***** FONCTIONS GLOBALES *****/
/******************************/
/**
 * 
 * @param data
 */
void write_d_aff(unsigned char data){
    LATH=data;
    TRISH=0x00;
    GLCD_CD=0; // DATA
    GLCD_CE=0;
    GLCD_WR=0;
    Nop();
    Nop();
    GLCD_WR=1;
    GLCD_CE=1;
}

/**
 * 
 * @param command
 */
void write_c_aff(unsigned char command){
    LATH=command;
    TRISH=0x00;
    GLCD_CD=1; // COMMAND
    GLCD_CE=0;
    GLCD_WR=0;
    Nop();
    Nop();
    GLCD_WR=1;
    GLCD_CE=1;
}

/**
 * 
 * @return 
 */
unsigned char check_status_ok(void){
    unsigned char res;


    TRISH=0xFF; // Donn�es en entr�e
    GLCD_CD=1;
    GLCD_CE=0;
    GLCD_RD=0;
    Nop();
    Nop();
    Nop();
    res=PORTH;
    GLCD_RD=1;
    GLCD_CE=1;

    if ((res&0x03)==0x03)
        res=1;
    else
        res=0;
    return res;
}

/**
 * 
 * @return 
 */
unsigned char wait_status_ok(void){
    unsigned char err,res,status;

    err=0;
    res=2;//res=2;
    while (res==2)
    {
        TRISH=0xFF; // Donn�es en entr�e
        GLCD_CD=1;
        GLCD_CE=0;
        GLCD_RD=0;
        Nop();
        status=PORTH;
        GLCD_RD=1;
        GLCD_CE=1;

        status=(status&0x03);
        if (status!=0x03)
        {
            err++;
            delai_us_char(12);
            if (err>=250)
            {
                //di();
                LED_R=0;LED_G=1;LED_B=1;//Fond rouge
                res=0;
            }
        }
        else
        {
            res=1;
        }
    }
    return res;
}

unsigned char command(unsigned char cmd)
{
    unsigned char res;

    res=0;

    if(wait_status_ok()==1)
    {
        delai_us_char(12);
        write_c_aff(cmd);
        res=1;
    }

    return res;
}

/**
 * 
 * @param d1
 * @param cmd
 * @return 
 */
unsigned char d1command(unsigned char d1, unsigned char cmd){
    unsigned char res;

    res=0;

    if (wait_status_ok()==1)
    {
        delai_us_char(12);
        write_d_aff(d1);
        if (wait_status_ok()==1)
        {
            delai_us_char(12);
            write_c_aff(cmd);
//            if (check_status_ok()==1)
                res=1;
        }

    }
    return res;
}


/**
 * 
 * @param d1
 * @param d2
 * @param cmd
 * @return 
 */
unsigned char d2command(unsigned char d1, unsigned char d2, unsigned char cmd){
    unsigned char res;

    res=0;

    if (wait_status_ok()==1)
    {
        delai_us_char(12);
        write_d_aff(d1);
        if (wait_status_ok()==1)
        {
            delai_us_char(12);
            write_d_aff(d2);
            if (wait_status_ok()==1)
            {
                delai_us_char(12);
                write_c_aff(cmd);
//                if (check_status_ok()==1)
                    res=1;
            }
        }
    }
    return res;
}


/**
 * 
 * @param ucdelai
 */
void delai_us_char(unsigned char ucdelai){
    // dure environ 1�s �12MHz
    while (ucdelai>0)
    {
        Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();Nop();
        ucdelai--;
    }
}


/**
 * 
 */
void initialisation_afficheur(void){

    unsigned char error_count;

    error_count=0;

    //initialisation des ports
    LATH=0;
    LATJ=0x1F;

    // Sens des ports
    TRISH=0;//Donn�es en sortie
    TRISJ=0;//Signaux de commande en sortie

    // Configuration du texte 40 colonnes et 16 lignes
    GLCD_MD=0; // 40 colonnes de texte
    GLCD_FS=1; // caract�res 6x8 pixels

    // Reset du lcd
    GLCD_RES=0;
    delai_us_char(4); // reset pendant 5 clock 830ns (fosc lcd = 6MHz)
    GLCD_RES=1;

    // V�rification du status

    delai_us_char(12);
    while(check_status_ok()==00)
    {
        error_count++;
        delai_us_char(12);
        if (error_count>200)
        {
            LED_G=1;LED_B=1;LED_R=0;// ECRAN ROUGE
            //di();
            //while(1);               //plantage
            error_count=0;
        }
    }

    // Register setting
    d2command(39,15,SET_CURSOR_POINTER);//curseur en bas � droite
    d2command(0,0,SET_OFFSET_REGISTER);
    d2command(0,0,SET_ADDRESS_POINTER);

    // CONTROL WORD
    d2command(0,0x7B,SET_TEXT_HOME_ADDRESS);
    d2command(40,0,SET_TEXT_AREA);
    d2command(0x00,0x80,SET_GRAPHIC_HOME_ADDRESS);
    d2command(NB_COL_GRAPH,0,SET_GRAPHIC_AREA);

    // MODE SET
    command(0x80); // OR MODE et Internal character generator Mode

    // DISPLAY MODE
    command(0x9C); // GRAPHIC_ON TEXT_ON CURSOR_OFF BLINK_OFF

    // CURSOR PATTERN SELECT
    command(0xA0); // 1 LINE CURSOR

    // CGROM FONT SELECT
    d1command(0x02,0x70); //Font 01
}


/**
 * 
 * @param dccar
 */
void draw_char(unsigned char dccar){
    if (dccar<32)//Caract�res non imprimables 0-31
    {
        dccar=0x3F;//'?'
    }
    if (dccar>0x9F)//Caract�res au del� de la table du controleur d'afficheur
    {
        dccar=0x3F;//'?'
    }
    dccar=dccar-32;// conversion table ascii � table afficheur
    while(d1command(dccar,0xC0)==0) Nop();
}


/**
 * 
 * @param tableau
 */
void draw_string(unsigned char * tableau){
    while(tableau[0]!=0)
    {
        while(d1command(tableau[0]-32,0xC0)==0)
            Nop();
        tableau++;
    }
}


/**
 * 
 * @param octet
 */
void draw_hex8(unsigned char octet){
    unsigned char c;

    c=(octet>>4);
    if (c>9)
        c=c+0x17;
    else
        c=c+0x10;
    while(d1command(c,0xC0)==0)
        Nop();

    c=(octet&0x0F);
    if (c>9)
        c=c+0x17;
    else
        c=c+0x10;
    while(d1command(c,0xC0)==0)
        Nop();

}


/**
 * 
 * @param ligne
 * @param colonne
 */
void goto_lico(unsigned char ligne, unsigned char colonne){
    unsigned int adr;//ne pas initialiser les static dans la d�claration

    adr=0x7B00;
    if (ligne>15) ligne=0;
    if (colonne>39) colonne=0;
    adr=adr+40*ligne+colonne;
    while(d2command((unsigned char)(adr&0x00FF),(unsigned char)(adr>>8),SET_ADDRESS_POINTER)==0)
        Nop();
}


/**
 * 
 */
void clear_text(void){
    unsigned int add;

    d2command(0,0,SET_ADDRESS_POINTER);
    for (add=0;add!=0x8000;add++)
    {
            d1command(0x00,0xC0);
    }
}


/**
 * 
 */
void clear_graphics(void){
    unsigned int add;

    d2command(0,0x80,SET_ADDRESS_POINTER);
    for (add=0x8000;add!=0xF800;add++)
    {
            d1command(0x00,0xC0);
    }
}


/**
 * 
 */
void clear_cgram(void){
    unsigned int add;

    d2command(0,0xF8,SET_ADDRESS_POINTER);
    for (add=0xF800;add!=0x0000;add++)
    {
            d1command(0x00,0xC0);
    }
}


/**
 * 
 * @param x
 * @param y
 */
void plot1(unsigned char x, unsigned char y){
    unsigned int add;

    add=NB_COL_GRAPH*y+x/6;
    d2command((char)(add&0xff),(char)(add>>8),SET_ADDRESS_POINTER);

    switch(x%6)
    {
        // Mise � 1 du pixel choisi
        case 0: command(0xFD); break;
        case 1: command(0xFC); break;
        case 2: command(0xFB); break;
        case 3: command(0xFA); break;
        case 4: command(0xF9); break;
        case 5: command(0xF8); break;
        default:break;
    }

}


/**
 * 
 * @param x
 * @param y
 */
void plot0(unsigned char x, unsigned char y){
    unsigned int add;

    add=NB_COL_GRAPH*y+x/6;
    d2command((char)(add&0xff),(char)(add>>8),SET_ADDRESS_POINTER);

    switch(x%6)
    {
        // Mise � 0 du pixel choisi
        case 0: command(0xF5); break;
        case 1: command(0xF4); break;
        case 2: command(0xF3); break;
        case 3: command(0xF2); break;
        case 4: command(0xF1); break;
        case 5: command(0xF0); break;
        default:break;
    }

}


/**
 * 
 * @param ligne
 * @param colonne
 * @param lenght
 */
void drawVericalLine(unsigned char ligne, unsigned char colonne, unsigned char lenght){
    unsigned char index = 0;

    for(index=0; index<lenght; index++)
    {
        plot1(colonne, ligne+index);
    }
}