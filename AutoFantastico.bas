'****************************************************************
'*  Name    : AutoFantastico.BAS                                *
'*  Author  : [Harold AJNP   EDITOR OPTIONS]                    *
'*  Notice  : Copyright (c) 2023 [select VIEW...EDITOR OPTIONS] *
'*          : All Rights Reserved                               *
'*  Date    : 07/03/2023                                        *
'*  Version : 1.0                                               *
'*  Notes   :                                                   *
'*          :                                                   *
'****************************************************************
;-------------------------------------------------------------------------------
;**** Added by Fuse Configurator ****
; Use the Fuse Configurator plug-in to change these settings

Device = 16F886

Config1 FOSC_EXTRC_CLKOUT, WDTE_ON, PWRTE_OFF, MCLRE_ON, CP_OFF, CPD_OFF, BOREN_ON, IESO_ON, FCMEN_ON, LVP_ON, DEBUG_OFF
Config2 BOR4V_BOR40V, WRT_OFF

;**** End of Fuse Configurator Settings ****
;-------------------------------------------------------------------------------

Declare Xtal 20 

Dim I As Byte 
Dim V As Word ;Variable que maneja a los 16 leds 

TRISB = 0: TRISB=0: ANSEL=0 : ANSELH=0

PORTB=0 : PORTC=0
 
 
MAIN: 
   V=1 
    For I=1 To 18 
    PORTB=V.Byte0 
    PORTC=V.Byte1
    DelayMS 100 
    
        If I<=3 Then 
        Select I
        Case 1
          V=3
        Case 2
          V=7
        Case 3
          V=15
    EndSelect
   
        Else 
        V=V<<1
   EndIf 
   Next I 
   
   For I=1 To 18 
    PORTB=V.Byte0 : PORTC=V.Byte1
    DelayMS 100
    
    If I<=3 Then 
     Select I
       Case 1
          V=49152
       Case 2
          V=57344 
       Case 3
          V=61440
    EndSelect 
    
    Else 
        V=V>>1
  EndIf 
Next I

GoTo MAIN 












