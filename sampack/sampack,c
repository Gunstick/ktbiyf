/* SAMPACK: Fast Lossy Sound Compression / Decompression      
 * Copyright 1992 by Georges Kesseler <georges.kesseler@restena.lu>
 *                                                                     
 * Permission to use, copy  and distribute this software and its documentation
 * for any purpose including using the algorithm in any program is hereby
 * granted, provided that the above copyright notice appears in all copies
 * and that both that copyright notice and this permission notice appear in
 * supporting documentation.
 * This software is provided "as is" without express or implied warranty.   
 *
 * Any modifications to the encoding method and the algorithm are reserved to
 * the author. 
 */

/* History:
 * original code (c) 1989 Unlimited Matricks Luxembourg (68000 Assembly)
 * 1990: optimisation, realtime operating (36kHz on an 8MHz 68000)
 * 1992: conversion to C
 */

/*
 * Some stories:
 * This program compresses any 8 bit PCM sound to half the size 
 * The sound quality is still very good. 
 * If people are interested in a 16 to 8 bit compression please inform me
 * before doing it on your own. I am already working on it (no tables this
 * time :-)
 * As this program was first written in assembler the C code is 
 * still assembler oriented (e.g. the tables for speed)
 * Directly converting to C was so difficult that finally the code
 * was entierly rewritten. This shows that some tricks possible in
 * assembler are impossible in C, or does anyone know how to test
 * if in an addition an overflow occured?
 */
#include <stdio.h>
#include <stdlib.h>
#define BYTE unsigned char

/* converter table:
 * IN:   difference of 2 samples
 * OUT:  code for this difference
 */
BYTE bestfit[256]= {
 0x0,0x1,0x2,0x2,0x3,0x3,0x3,0x4,0x4,0x4,0x4,0x4,0x4,0x5,0x5,0x5,
 0x5,0x5,0x5,0x5,0x5,0x5,0x5,0x5,0x5,0x6,0x6,0x6,0x6,0x6,0x6,0x6,
 0x6,0x6,0x6,0x6,0x6,0x6,0x6,0x6,0x6,0x6,0x6,0x6,0x6,0x6,0x6,0x6,
 0x6,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,
 0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,
 0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,0x7,
 0x7,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,
 0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,
 0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,
 0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,0x8,
 0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,
 0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,
 0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9,0xa,
 0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xa,
 0xa,0xa,0xa,0xa,0xa,0xa,0xa,0xb,0xb,0xb,0xb,0xb,0xb,0xb,0xb,0xb,
 0xb,0xb,0xb,0xb,0xc,0xc,0xc,0xc,0xc,0xc,0xd,0xd,0xd,0xe,0xe,0xf};

/* decoder table */
BYTE decodetab[16]={0,1,2,4,8,16,32,64,128,-64,-32,-16,-8,-4,-2,-1};

int kompress(in,out)
FILE *in,*out;
{                                         
 BYTE result,code;
 BYTE sample,diff;
 short xact;
 BYTE wert;
 
 if ((xact=fgetc(in))<0) return(1);
 wert=(BYTE)xact;
 fputc(wert,out);
 while (1)
  {                           
   if((xact=fgetc(in))<0) return(2);
   sample=(BYTE)xact;                   /* read sample */
   code=bestfit[(BYTE)(sample-wert)];   /* get approx code */
   diff=decodetab[(BYTE)code];          /* get delta value */
   
   xact=sample-(BYTE)(wert+diff);               
   if((xact>128)||(xact<-128))          /* if abs(xact)>128 */
    if (sample<wert) code++;            /* get better code */
    else code--;
   wert+=decodetab[(BYTE)code];         /* calc with definitive code */
   result=code<<4;                      /* first nibble */

   if((xact=fgetc(in))<0) return(3);
   sample=(BYTE)xact;
   code=bestfit[(BYTE)(sample-wert)];
   diff=decodetab[(BYTE)code];
   xact=sample-(BYTE)(wert+diff);
   if ((xact>128)||(xact<-128))
    if (sample<wert) code++;
    else code--;
   wert+=decodetab[(BYTE)code]; 
   fputc(result+code,out);                        /* second nibble */
  }
}


int dekompress(in,out)
FILE *in,*out;
{
 short code;
 BYTE wert;
 
 if ((code=fgetc(in))<0) return(1);
 wert=(BYTE)code;
 fputc(wert,out);
 while ((code=fgetc(in))>=0)
  {
   wert+=decodetab[code>>4];
   fputc(wert,out);
   wert+=decodetab[code&0xf];
   fputc(wert,out);
  }
 return(2);
}


void error()
{
 fprintf(stderr,"Usage: sampack [-d] [infile] >outfile\n");
 fprintf(stderr,"Sample packer by Georges.Kesseler@restena.lu\n");
 exit(1);
}

#define KOMPRESS 1
#define DEKOMPRESS 2
int main (argc,argv)
int argc;
char *argv[];
{
 int fi,fo;
 int mode=KOMPRESS,par=1;
 
 putchar('\n');
 
 if ((argc > 1) && (argv[1][0]=='-')) 
  {
   par=2;
   if (argv[1][1]=='d') mode = DEKOMPRESS;
   else error();
  }

 if (argc > par)
 {
  fi=open( argv[par], "rb");
  if (argc > par+1)
    fo=fopen( argv[par+1], "wb");
  else
    fo=stdout;
 }
 else
  fi=stdin;

 if((fi!=NULL)&&(fo!=NULL)) 
  {
   if(mode==KOMPRESS)
    {
     kompress(fi,fo);
     fclose(fi);
     fclose(fo);
    }
   else
    {   
     dekompress(fi);
     fclose(fi);
     fclose(fo);
    }
  }
 else
  error();
 return(0);
}
