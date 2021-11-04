#include "p16F887.inc"  
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF
 
RES_VECT CODE 0x0000  
    BCF PORTA,0		
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		
    CALL time
    BCF PORTA,1
    CALL time
  
    GOTO    START                   

MAIN_PROG CODE                      

i EQU 0x20
j EQU 0x21
k EQU 0x25
m EQU 0x26
x equ 0x30
y equ 0x31
z equ 0x32
a equ 0x33 
C0 equ 0x34
C1 equ 0x38
C2 equ 0x39
C3 equ 0x40
C4 equ 0x41
C5 equ 0x42
C6 equ 0x43
C7 equ 0x44
I0 equ 0x45
I1 equ 0x46
I2 equ 0x47
I3 equ 0x48
I4 equ 0x49
I5 equ 0x50
I6 equ 0x51
I7 equ 0x52
ENTER equ 0x53
AUX equ 0x54
AUX2 equ 0x55
Apuntador equ 0x56

START

    BANKSEL PORTA ;
    CLRF PORTA 
    BANKSEL ANSEL ;
    CLRF ANSEL 
    CLRF ANSELH
    BANKSEL TRISA ;
    CLRF TRISA
    CLRF TRISB
    MOVLW b'11111111'
    MOVWF TRISC
    CLRF TRISD
    CLRF TRISE
    BCF STATUS,RP1
    BCF STATUS,RP0
    GOTO INICIO
    
INITLCD
    CLRF PORTA
    CLRF PORTB
    CLRF PORTC
    CLRF PORTD
    CLRF PORTE
    CLRF ENTER
    CLRF AUX
    CLRF AUX2
    CLRF C0
    CLRF C1
    CLRF C2
    CLRF C3
    CLRF C4
    CLRF C5
    CLRF C6
    CLRF C7
    CLRF I0
    CLRF I1
    CLRF I2
    CLRF I3
    CLRF I4
    CLRF I5
    CLRF I6
    CLRF I7
    CLRF Apuntador
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
INICIO	  
    CALL INITLCD
    CALL Interfaz_Inicio
    CALL tiempo
    CALL INITLCD
    CALL Interfaz_Contra
    
    MOVLW 0xC7
    MOVWF Apuntador
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    CALL Contrasena
    
    MOVLW 0xD7
    MOVWF Apuntador
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    CALL Confirmar
    
    CALL Comparacion
    BTFSS ENTER, 3
    CALL Correcto
    BTFSC ENTER, 3
    CALL Incorrecto
    
    BSF PORTD, 2
    BTFSS PORTC, 3
    GOTO $-1
    
    GOTO INICIO
    
Incorrecto:
    CALL INITLCD
       
    BCF PORTA,0		
    CALL time
    MOVLW 0x80	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW 's'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTA,0		
    CALL time
    MOVLW 0xC0	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW 'c'
    MOVWF PORTB
    CALL exec
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW 'c'
    MOVWF PORTB
    CALL exec
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW '('
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTA,0		
    CALL time
    MOVLW 0x90	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW 'g'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW 's'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTA,0		
    CALL time
    MOVLW 0xD0	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'p'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW 'c'
    MOVWF PORTB
    CALL exec
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    MOVLW 'i'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'u'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    RETURN
    
Correcto:
    CALL INITLCD
       
    BCF PORTA,0		
    CALL time
    MOVLW 0x80	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW 's'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTA,0		
    CALL time
    MOVLW 0xC0	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW 'c'
    MOVWF PORTB
    CALL exec
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ')'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTA,0		
    CALL time
    MOVLW 0x90	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW 'g'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW 's'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTA,0		
    CALL time
    MOVLW 0xD0	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'p'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW 'c'
    MOVWF PORTB
    CALL exec
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    MOVLW 'i'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'u'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    RETURN
    
Comparacion:
    MOVFW C0
    MOVWF AUX
    MOVFW I0
    MOVWF AUX2
    CALL Comparar
    
    MOVFW C1
    MOVWF AUX
    MOVFW I1
    MOVWF AUX2
    CALL Comparar
    
    MOVFW C2
    MOVWF AUX
    MOVFW I2
    MOVWF AUX2
    CALL Comparar
    
    MOVFW C3
    MOVWF AUX
    MOVFW I3
    MOVWF AUX2
    CALL Comparar
    
    MOVFW C4
    MOVWF AUX
    MOVFW I4
    MOVWF AUX2
    CALL Comparar
    
    MOVFW C5
    MOVWF AUX
    MOVFW I5
    MOVWF AUX2
    CALL Comparar
    
    MOVFW C6
    MOVWF AUX
    MOVFW I6
    MOVWF AUX2
    CALL Comparar
    
    MOVFW C7
    MOVWF AUX
    MOVFW I7
    MOVWF AUX2
    CALL Comparar
    
    RETURN
    
Comparar:
    MOVFW AUX
    SUBWF AUX2, 0
    BTFSC STATUS, C
    GOTO $+2
    GOTO $+3 
    CALL MENOR_IGUAL
    RETURN
    RETURN
    
MENOR_IGUAL:
    
    BTFSC STATUS, Z ; Z = 1
    RETURN
    BTFSS STATUS, Z ; Z = 0
    BSF ENTER, 3
    RETURN
    
Confirmar:
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF I0
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF I1
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF I2
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF I3
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF I4
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF I5
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF I6
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF I7
    CLRF ENTER
    
    BSF PORTD, 0
    BTFSS PORTC, 3
    GOTO $-2
    BCF PORTD, 0
    
    RETURN
    
Contrasena:
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF C0
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF C1
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF C2
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF C3
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF C4
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF C5
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF C6
    CLRF ENTER
    INCF Apuntador, 1
    
    CALL Ingresar_Digitos
    BTFSS ENTER, 1
    GOTO $-2
    MOVFW AUX
    MOVWF C7
    CLRF ENTER
    
    BSF PORTD, 0
    BTFSS PORTC, 3
    GOTO $-2
    BCF PORTD, 0
    
    RETURN
    
Ingresar_Digitos:
    BSF PORTD, 2
    BTFSC PORTC, 0
    CALL UNO_1
    BTFSC PORTC, 1
    CALL CUATRO_1
    BTFSC PORTC, 2
    CALL SIETE_1
    BCF PORTD, 2
    
    BSF PORTD, 1
    BTFSC PORTC, 0
    CALL DOS_1
    BTFSC PORTC, 1
    CALL CINCO_1
    BTFSC PORTC, 2
    CALL OCHO_1
    BTFSC PORTC, 3
    CALL CERO_1
    BCF PORTD, 1
    
    BSF PORTD, 0
    BTFSC PORTC, 0
    CALL TRES_1
    BTFSC PORTC, 1
    CALL SEIS_1
    BTFSC PORTC, 2
    CALL NUEVE_1
    BCF PORTD, 0
    RETURN

    
CERO_1:
    
    BSF ENTER, 1
    MOVLW d'0'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '0'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 3
    GOTO $-1
    RETURN
    
UNO_1:
    BSF ENTER, 1
    MOVLW d'1'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '1'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 0
    GOTO $-1
    RETURN

DOS_1:
    BSF ENTER, 1
    MOVLW d'2'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '2'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 0
    GOTO $-1
    RETURN

TRES_1:
    BSF ENTER, 1
    MOVLW d'3'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '3'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 0
    GOTO $-1
    RETURN

CUATRO_1:
    BSF ENTER, 1
    MOVLW d'4'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '4'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 1
    GOTO $-1
    RETURN
    
CINCO_1:
    BSF ENTER, 1
    MOVLW d'5'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '5'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 1
    GOTO $-1
    RETURN
    
SEIS_1:
    BSF ENTER, 1
    MOVLW d'6'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '6'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 1
    GOTO $-1
    RETURN
    
SIETE_1:
    BSF ENTER, 1
    MOVLW d'7'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '7'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 2
    GOTO $-1
    RETURN
    
OCHO_1:
    BSF ENTER, 1
    MOVLW d'8'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '8'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 2
    GOTO $-1
    RETURN
    
NUEVE_1:
    BSF ENTER, 1
    MOVLW d'9'
    MOVWF AUX
    
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '9'
    MOVWF PORTB
    CALL exec
    
    CALL tiempo
    BCF PORTA,0		
    CALL time
    MOVFW Apuntador	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW '*'
    MOVWF PORTB
    CALL exec
    
    
    
    BTFSC PORTC, 2
    GOTO $-1
    RETURN
    
Interfaz_Contra:
    BCF PORTA,0		
    CALL time
    MOVLW 0x80	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    MOVLW 'T'
    MOVWF PORTB
    CALL exec
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		
    CALL time
    MOVLW 0x90	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    MOVLW 'F'
    MOVWF PORTB
    CALL exec
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    MOVLW 'M'
    MOVWF PORTB
    CALL exec
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    RETURN
    
Interfaz_Inicio:
    
    BCF PORTA,0		
    CALL time
    MOVLW 0x80	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    MOVLW 'G'
    MOVWF PORTB
    CALL exec
    MOVLW 'U'
    MOVWF PORTB
    CALL exec
    MOVLW 'N'
    MOVWF PORTB
    CALL exec
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW 'P'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTA,0		
    CALL time
    MOVLW 0xC0	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    MOVLW 'l'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW 'V'
    MOVWF PORTB
    CALL exec
    MOVLW 'i'
    MOVWF PORTB
    CALL exec
    MOVLW 'd'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW 'l'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTA,0		
    CALL time
    MOVLW 0x90	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    MOVLW 'p'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    MOVLW 'e'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW 'u'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW 'B'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTA,0		
    CALL time
    MOVLW 0xD0	
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		
    CALL time
    
    MOVLW 'p'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    MOVLW 'c'
    MOVWF PORTB
    CALL exec
    MOVLW 'o'
    MOVWF PORTB
    CALL exec
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    MOVLW 't'
    MOVWF PORTB
    CALL exec
    MOVLW 'i'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'n'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'u'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'a'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'r'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    MOVLW '.'
    MOVWF PORTB
    CALL exec
    
    C_L
    BSF PORTD, 2
    BTFSC PORTC, 0
    RETURN
    BTFSC PORTC, 1
    RETURN
    BTFSC PORTC, 2
    RETURN
    BTFSC PORTC, 3
    RETURN
    BCF PORTD, 2
    
    BSF PORTD, 1
    BTFSC PORTC, 0
    RETURN
    BTFSC PORTC, 1
    RETURN
    BTFSC PORTC, 2
    RETURN
    BTFSC PORTC, 3
    RETURN
    BCF PORTD, 1
    
    BSF PORTD, 0
    BTFSC PORTC, 0
    RETURN
    BTFSC PORTC, 1
    RETURN
    BTFSC PORTC, 2
    RETURN
    BTFSC PORTC, 3
    RETURN
    BCF PORTD, 0
    GOTO C_L
    
    
exec

    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN

tiempo: ; Calibrador para 3 microsegundos 
		; NOTA: PARA 1 SEG QUITAR ESTE NOP, para 0.191099 seg esta bien
    movlw d'207' 
    movwf m
    
mloop:
    decfsz m,f
    goto mloop
    movlw d'195' 
    movwf i
    
iloop:
    nop 
    nop
    movlw d'20' 
    movwf j
    
jloop:
    nop 
    movlw d'21' 
    movwf k
kloop:
    decfsz k,f
    goto kloop
    decfsz j,f
    goto jloop
    decfsz i,f
    goto iloop
    return     

   
			
    END
