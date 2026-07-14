*&---------------------------------------------------------------------*
*& Report ZKIT_TST3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkit_tst4.
** De la tabla ZDEL_PARTNER encuentra los registros que tenga ZIP_CODE mayor o igual
** a 50000 y menor o igual a 65000 y muestralos en una tabla,
** ordenar de forma alfabetica
** Colocar una X en la columan mandt si el C.P. es < 55,000 sino poner Y

** total de registros 447

DATA: nomtab1 TYPE STANDARD TABLE OF zdel_partner.
**PARTNER_ID
**CLIENT_ID
**NAME
**ADDRESS
**PHONE_NUMBER
**ZIP_CODE
**CREATED_AT
**CREATED_BY
**UPDATED_AT
**UPDATED_BY

SELECT client_id, name FROM zdel_partner INTO CORRESPONDING FIELDS OF TABLE @nomtab1.
**selección por columnas (campos) especificos y colocando el orden respectivo

SELECT * FROM zdel_partner APPENDING TABLE @nomtab1.
** el * determina que se traiga todos loc valores de todas las columnas y sobreescribe en la tabla anterior dado que tienen el mismo nombre @nomtab1

SELECT * FROM zdel_partner INTO TABLE @nomtab1
WHERE zip_code BETWEEN '50000' AND '65000'
ORDER BY address DESCENDING.
**cl_demo_output=>display( nomtab1 ).
**debe de ir debajo de la ultima instrucciòn que se desea mostrar

DATA: nuv_var_tab TYPE zdel_partner.
** cuando empieza con Z normlamente se refiere a una definicion del dicc,
DATA: indicex TYPE i, indicey TYPE i, indicez TYPE p LENGTH 16 DECIMALS 11.

DATA: nuv_indice LIKE nomtab1.
**cl_demo_output=>display( nuv_indice ).
**como la tabla es nueva no trae datos

CONSTANTS c55 VALUE '55000' TYPE string.
** se pueden reemplazar los valores en verdes por referencias cortas

LOOP AT nomtab1 INTO nuv_var_tab.
**  mandt = if ( zip_code <'55000' se agrego la linea 46 en donde remplazmaos los 5500 por c55, X, Y )
  IF nuv_var_tab-zip_code < c55 AND nuv_var_tab-zip_code = c55 OR nuv_var_tab-zip_code < '55500'.
    nuv_var_tab-mandt = 'x'.
    indicex = indicex + 1.
  ELSEIF nuv_var_tab-zip_code < '55501'.
    nuv_var_tab-mandt = 'z'.
    indicez = indicez + '3.1416'.
  ELSE.
** else se interpreta como sino cumple alguna de las condiciones previas
    IF nuv_var_tab-zip_code = '70000'.
** esta vacia por ende lo deja vacio
    ELSE.
      nuv_var_tab-mandt = 'Y'.
      indicey = indicey + 7.
    ENDIF.
  ENDIF.
  APPEND nuv_var_tab TO nuv_indice.
**  la linea 45 y 46 se repiten renglon por renglon hasta que lleguen al renglon 141 - se le llama ciclo a los renglones
ENDLOOP.
cl_demo_output=>display( nuv_indice ).
**debe de ir debajo de la ultima instrucción que se desea mostrar

**WRITE: 'X :', indicex, 'y :', indicey, 'z :', indicez.
** al ponerlos seguidos el resultado es horizontal
**WRITE: 'y :', indicey.
**WRITE: 'z :', indicez.

WRITE:/ 'X :', indicex.
WRITE:/ 'y :', indicey.
WRITE:/ 'z :', indicez.
** al ponerlos en renglones con la diagonal despues de los : los coloca como tabla
