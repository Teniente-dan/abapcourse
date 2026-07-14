*&---------------------------------------------------------------------*
*& Report ZGP_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgp_test.
WRITE 'hello world'.
"TYPING
DATA: ubnst TYPE p DECIMALS 4 LENGTH 10,
      testo TYPE c LENGTH 10,
      teste TYPE c LENGTH 10,
      "LIKE
*      testi LIKE ubnst.
      "CTRL + D
*      testi LIKE ubnst.
      testi LIKE testo.
"DECIMALS
ubnst = '12.1'.

"AUTOMATIC TRANSFORM
WRITE |{ ubnst + 1 }|.

testo = ubnst + 1.
WRITE testo.
"TYPE TRANSFORM
testi = ubnst + 1.
WRITE testi.

"DUMP
*testo = 'testo'.
*teste = 'teste'.
*DATA(testw) = teste + testo.
*WRITE testw.

*DATA testq TYPE zdtel_char20.
*DATA testr TYPE zkit_ozy.

TYPES: t_testo  TYPE zdtel_char20,
       t_testo1 LIKE testo,
       t_testo2 TYPE t_testo,
       t_testo3 TYPE d.


WRITE: teste, testo.

*ESTO NO QUEREMOS HACER
DATA: BEGIN OF est1,
        ty_troya   TYPE c LENGTH 100,
        num_753951 TYPE i,
        coor_10_13 TYPE c LENGTH 100,
      END OF est1.


DATA: tablas LIKE STANDARD TABLE OF est1.

INSERT est1 INTO TABLE tablas.
*cl_demo_output=>display( tablas ).


TYPES: BEGIN OF helados,
         chocolate TYPE string,
         vainilla  TYPE i,
         fresa     TYPE string,
*         testo     LIKE tablas,
       END OF helados,

       sabores_de_helados TYPE STANDARD TABLE OF helados.

DATA: heladeria  TYPE helados,
      heladerias TYPE sabores_de_helados.

heladeria-chocolate = 'chispas de chocolate'.
heladeria-vainilla = 123.
heladeria-fresa = 'con crema'.
INSERT heladeria INTO TABLE heladerias.

heladeria-chocolate = 'chispas de colores'.
heladeria-vainilla = 456.
heladeria-fresa = 'galletas'.
INSERT heladeria INTO TABLE heladerias.

heladeria-chocolate = 'chispas de sabores'.
heladeria-vainilla = 43.
heladeria-fresa = 'cubierta de chocolate'.
INSERT heladeria INTO TABLE heladerias.

heladeria-chocolate = 'chispas de frutas'.
heladeria-vainilla = 645.
heladeria-fresa = 12.
INSERT heladeria INTO TABLE heladerias.

cl_demo_output=>display( heladerias ).



DATA: BEGIN OF est,
        v1 TYPE string,
        v2 TYPE string,
        BEGIN OF est2,
          v4 TYPE string,
          v5 TYPE string,
        END OF est2,
        v3 TYPE string,
      END OF est,
      tables LIKE STANDARD TABLE OF est.

est-est2-v4 = 12.
*BREAK-POINT.
