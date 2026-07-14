*&---------------------------------------------------------------------*
*& Report ZKIT_TST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkit_tst.
*aák'ab.
WRITE 'maloob aák ab XKat'.
DATA:imperator_rex TYPE c LENGTH 100.
WRITE imperator_rex.
imperator_rex = 'Romae'.
WRITE imperator_rex.
imperator_rex = 10000.
WRITE imperator_rex.
DATA: ishtar     TYPE p DECIMALS 13 LENGTH 16,
      uruk       TYPE c LENGTH 103,
      cunilingus TYPE c LENGTH 1700,
*aurum      LIKE ishtar.
      aurum      LIKE cunilingus.
ishtar = '21.3490187890153'.
WRITE / | Enkidu ^ Gil >>> { ( '-9345.93465' + '7.3' * ishtar + 1 / 3452346 ) + ( 5325 ** 3 ) }|.
*para elevar en lugar de usar ^ se pone con **
uruk = ishtar + 41.
WRITE / uruk.
aurum = uruk + 7.
WRITE aurum.

DATA: the_boys TYPE zdtel_char20.
*the_boys S5E3
DATA:proeliatores TYPE c LENGTH 100.
TYPES: liberi TYPE d.
DATA: chaman TYPE liberi.
TYPES: goethia TYPE c LENGTH 301,
       mikigai TYPE zdtel_char20,
       indi    TYPE mikigai,
       uranus  LIKE the_boys.
