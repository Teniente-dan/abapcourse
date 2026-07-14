*&---------------------------------------------------------------------*
*& Report ZPG_SNOOPY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zpg_snoopy.

DATA: snoopy_morado TYPE c LENGTH 20,
      charlie_brown LIKE snoopy_morado.

TYPES: santa_maria  TYPE i.
DATA: kuromi TYPE santa_maria.

TYPES: san_rafael TYPE santa_maria,
       electolito LIKE snoopy_morado.

DATA: harry_potter TYPE san_rafael,
      hogwarts     TYPE electolito.

harry_potter = 15.
hogwarts = 'asustado potter? ni un poco'.

snoopy_morado = 'vive arriba de su casa'.

WRITE: harry_potter, hogwarts, snoopy_morado.

*TIPOS AVANZADOS:
*TYPES: AVANZADO TYPE REF TO

*DATA: La_camara_secreta

TYPES: agua_de_limon TYPE string.
DATA: agua TYPE agua_de_limon.


agua = 'AGUA MINERAL'.

TYPES: soda TYPE c LENGTH 15.
DATA: refresco TYPE soda.

refresco = 'COCA COLCA'.


"ESTRCUTURAS"

TYPES: BEGIN OF HELADOS,
  Chocolate TYPE string,
  vainilla TYPE string,
  fresa TYPE C LENGTH 20,
  END OF helados.

  data: heladeria type helados.
  heladeria-chocolate = 'chispas de chocolate'.
  heladeria-vainilla = 'papas a la francesa'.
  heladeria-fresa = 'con crema'.

  WRITE / .
  write: heladeria-chocolate, heladeria-vainilla, heladeria-fresa.

*  TABLAS

  TYPES: SABORES_DE_HELADOS TYPE STANDARD TABLE OF helados.
  DATA: HELADERIAS TYPE sabores_de_helados.
  cl_demo_output=>display( heladerias ).
  INSERT HELADERIA INTO TABLE heladerias.
  cl_demo_output=>display( heladerias ).

   heladeria-chocolate = 'chispas de colores'.
  heladeria-vainilla = 'helado de fresa'.
  heladeria-fresa = 'galletas'.
  INSERT heladeria INTO TABLE heladerias.
  cl_demo_output=>display( heladerias ).
  write: heladeria-chocolate, heladeria-vainilla, heladeria-fresa.

  heladeria-chocolate = 'chispas de sabores'.
  heladeria-vainilla = 'platano'.
  heladeria-fresa = 'cubierta de chocolate'.
  INSERT heladeria INTO TABLE heladerias.
  cl_demo_output=>display( heladerias ).
