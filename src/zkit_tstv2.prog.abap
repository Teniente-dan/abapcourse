*&---------------------------------------------------------------------*
*& Report ZKIT_TSTV2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkit_tstv2.
DATA: var1 TYPE c LENGTH 301.
** como linea 29 sin asig valor y tipo ("c y debe llevar longitud")

DATA: var2 TYPE dats.
var2 = '652165'.
** como linea 29 y 30 - con valor asignado y tipo ("fecha")

TYPES: mikigai TYPE d.
TYPES: t1 TYPE c LENGTH 301,
       t2 TYPE zdtel_char20,
       t3 TYPE mikigai,
       t4 LIKE var1.
DATA: var3 TYPE t2.
** como linea 23 a 25, la 15 a 18 deben ir ya que no se asigno la variable
** types: T5 TYPE REF TO (esto es otra funciòn que veremos)
** acaba arriba en la 15 son tipos independientes diff a un tipo de estructura

TYPES: entero TYPE i.
TYPES: ent1 TYPE i.
DATA: var4 TYPE ent1.
var4 = '77'.
** ya tiene tipo(entero "i"), variable y valor asignado

TYPES: t5 TYPE string.
DATA: var5 TYPE t5.
var5 = 'setenta y siete'.
** ya tiene tipo (caracter "string"), variable y valor asignado

** los valro peuden ser texto, num, imagen, cordenadas (puede ser ubbicacion o la de un plano cartesiano), todo lo que se pueda representar en bits y bytes, ceros y unos

** valor numero puede ser texto o seea entre ' ' o numerico pelon

** valor numerico e.g. coordenas por la coma o comilla debe deir entre comillas

** Estos son los valores que voy a manipular
** 'Troya' texto entonces puede ser string o c
** 753951 numero
** '10,13' coordenada

** Todo lo de abajo es el tipo de la estructura que son compatibles con los valores que queremos manipular linea 42, 43 y 44
TYPES: BEGIN OF t300,
** todos los nombres deben de empezar con una letra para poder poner numeros eg, si quiero poner 300 podrìa ser t300
** siempre se empieza con types, luego se NOMBRa el tipo de valor
** la COMA te permite continuar
         ty_troya   TYPE c LENGTH 100,
** no se puede dejar un espacio cuando se nombra
         num_753951 TYPE i,
** no se puede dejar un espacio cuando se nombra
         coor_10_13 TYPE c LENGTH 100,
       END OF t300.
** no se puede dejar un espacio cuando se nombra

** A partir de aqui para abajo es ESTRUCTURA
DATA: est1 TYPE t300.
** todo lo que se declare en DATA va a ser variables, estructura, tabla, tabla anidada, u objetos y refrencias
