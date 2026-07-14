*&---------------------------------------------------------------------*
*& Report ZPG_PRUEBA_TR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zpg_prueba_tr.
WRITE / 'APRENDIENDO A PROGRAMAR'.
WRITE / 'PROGRAMACION'.
DATA: primer_variable TYPE c LENGTH 100.
primer_variable = 'LO QUE SEA HOLA KARLA PAOLA'.
WRITE / primer_variable.

*TIPOS PRIMITIVOS DE VARIABLES
*NUMERICOS: I: ES UN NUMERO ENTERO P: PARA NUMEROS DECIMALES
DATA: numero_decimal TYPE p DECIMALS 4 LENGTH 10,
      numero_entero  TYPE i,
*      numero_entero  TYPE D,
*      variable_texto TYPE c LENGTH 15.
      variable_texto TYPE c LENGTH 15,
*      variable_copia LIKE numero_entero.
      variable_copia LIKE numero_decimal.
numero_decimal = '12345678901.1234'.
WRITE / numero_decimal.
numero_entero = 1234567.
WRITE / numero_entero.

DATA: patitos TYPE c LENGTH 50,
      patitos_copia LIKE patitos.

WRITE /.
WRITE / 'actualizar variable'.
WRITE /.
numero_decimal = '12.1'.
WRITE / numero_decimal. "R: 12.1
numero_decimal = numero_decimal + 1.
WRITE / numero_decimal. "R: 13.1
WRITE / numero_decimal."R: 13.1
variable_copia = numero_decimal + 1.
WRITE / numero_decimal. "R: 13.1
WRITE / variable_copia."R: vriable copia 14.1
