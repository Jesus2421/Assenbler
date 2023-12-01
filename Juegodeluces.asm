list p=16f84
include <p16f84A.inc>
 __CONFIG  _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

TIEMPO EQU 0x0C
TIEMPO2 EQU 0x0D
        org 0
        bsf STATUS,RP0 ; que se coloque en uno el bit RP0=BANCO 1
        CLRF PORTB ; SALIDA
        bcf STATUS,RP0
; ZONA DE CODIGO
INICIO       
         MOVLW B'00000000'    
         MOVWF PORTB
		 CALL RETARDO
         MOVLW B'00000001'    
         MOVWF PORTB
		 CALL RETARDO
         MOVLW B'00000010'    
         MOVWF PORTB
		 CALL RETARDO
         MOVLW B'00000100'    
         MOVWF PORTB
		 CALL RETARDO       
RETARDO
          MOVLW D'255' 
          MOVFW TIEMPO ;TIEMPO=255
DEC       DECFSZ TIEMPO
          GOTO DEC1
		  RETURN
DEC1      MOVLW D'255' 
          MOVFW TIEMPO2 ;TIEMPO=255
DEC2      DECFSZ TIEMPO2
          GOTO DEC2
		  GOTO DEC
END