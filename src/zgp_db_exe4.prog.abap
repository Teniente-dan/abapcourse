*write: zcl_cagp_demo=>apply_tax( amount = 10 ).
*&---------------------------------------------------------------------*
*& Report ZGP_DB_EXE4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgp_db_exe4.
*
*
*DATA: cualquier_variable TYPE string,
*      otra_variable      TYPE c LENGTH 10.
*
DATA: una_estructura TYPE zdel_partner.
*
*otra_variable = 'texto 10'.
*
*
*
*
*
*
*
*cualquier_variable = 'cualquier texto literal'.
*
*
*
*cualquier_variable = otra_variable.
*
*cualquier_variable = 10.
*IF 1 > 2.
*  cualquier_variable = 20.
*ELSE.
*  cualquier_variable = 0.
*ENDIF.
*
*cualquier_variable = cualquier_variable + otra_variable + una_estructura-name.
*" 0 + 10 = 10
*" 20 + 10 = 30
*
*
*cualquier_variable = otra_variable + 10 * 4.
*WRITE cualquier_variable.
*"'texto1040'



DATA: valor_de_venta      TYPE p LENGTH 16 DECIMALS 2,
      total_con_impuestos LIKE valor_de_venta.

valor_de_venta = '10'.

total_con_impuestos = valor_de_venta * '1.16'.
WRITE:/ total_con_impuestos.


total_con_impuestos = zcl_cagp_demo=>apply_tax( valor_de_venta ).

WRITE:/ valor_de_venta.
WRITE:/ total_con_impuestos.

WRITE:/.
DATA: comision TYPE i VALUE 5.
total_con_impuestos = zcl_cagp_demo=>apply_tax( valor_de_venta ) + comision.

WRITE:/ valor_de_venta.
WRITE:/ total_con_impuestos.


WRITE:/.
total_con_impuestos = zcl_cagp_demo=>apply_tax( valor_de_venta + comision ) .

WRITE:/ valor_de_venta.
WRITE:/ total_con_impuestos.



*una_estructura = zcl_cagp_demo=>apply_tax( valor_de_venta ) .
*una_estructura-zip_code = zcl_cagp_demo=>apply_tax( valor_de_venta ) .
