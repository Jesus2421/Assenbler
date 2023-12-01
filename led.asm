list p=16f84
include <p16f84A.inc>
TIEMPO EQU 0x0C
        org 0
        bsf STATUS,RP0 ; que se coloque en uno el bit RP0=BANCO 1
        CLRF PORTB ; SALIDA
        bcf STATUS,RP0
; ZONA DE CODIGO
INICIO         BCF PORTB , 0 ; coloca en 1 el pim 0del puerto b 
               CALL RETARDO
               BSF PORTB,0
               GOTO INICIO
RETARDO
          MOVLW D'255' 
          MOVFW TIEMPO ;TIEMPO=255
DEC       DECFSZ TIEMPO
          GOTO DEC
          RETURN
END 