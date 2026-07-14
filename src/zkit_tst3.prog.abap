*&---------------------------------------------------------------------*
*& Report ZKIT_TST3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkit_tst3.
** De la tabla ZDEL_PARTNER encuentra los registros que tenga ZIP_CODE mayor o igual
**a 50000 y menor o igual a 65000 y muestralos en una tabla,
** ordenar de forma alfabetica
**y agrega el indice en una columna

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
DATA: indice TYPE i.

data: nuv_indice like nomtab1.
**cl_demo_output=>display( nuv_indice ).
**como la tabla es nueva no trae datos

LOOP AT nomtab1 INTO nuv_var_tab.
  indice = indice + 1.
  nuv_var_tab-mandt = indice.
  APPEND nuv_var_tab to nuv_indice.
**  la linea 45 y 46 se repiten renglon por renglon hasta que lleguen al renglon 141 - se le llama ciclo a los renglones
ENDLOOP.
cl_demo_output=>display( nuv_indice ).
**debe de ir debajo de la ultima instrucciòn que se desea mostrar
