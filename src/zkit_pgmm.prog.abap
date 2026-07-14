

*&---------------------------------------------------------------------*
*& Report ZKIT_PGMM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zkit_pgmm.

DATA: name_var              TYPE string,
      zip_code_var          TYPE string,
      balance_sheet_var     TYPE i,
      curr_var              TYPE string,
      balance_sheet_usd_var TYPE i,
      indiceusd             TYPE i.
** estas son las variables

DATA:
** DATA: estpgg_mm TYPE zdel_partner.
** esta es la estructura y las estructuras son filas en las tablas
** se va a cambiar la tabla de la BD (diccionario) >>> zdel_partner <<< por una estructura a la medida

  BEGIN OF estpgg_mm,
** todos los nombres deben de empezar con una letra
** name, zip_code, total, curr
    name     TYPE c LENGTH 100,
    zip_code TYPE c LENGTH 100,
** no se puede dejar un espacio cuando se nombra e.g. "zip code" tiene que ir "zip_code"
    total    TYPE i,
    bono     TYPE i,
    curr     TYPE c LENGTH 100,
  END OF estpgg_mm.

** DATA: pgg_mm TYPE STANDARD TABLE OF zdel_partner.
** esta es la tabla
** para igualar las columnas con la nueva tabla "estpgg_mm" se debe de cambiar la fuente, es decir,
** "TYPE" iguala las columnas del diccionario (zdel_partner) y mi estructura tiene menos columnas, por ende
** la instruccion de la linea 40

DATA: pgg_mm LIKE STANDARD TABLE OF estpgg_mm.
** se pondra "LIKE" porque se copia el formato de la estructura

SELECT name, zip_code, total, curr FROM zdel_partner INTO CORRESPONDING FIELDS OF TABLE @pgg_mm.
** se tiene que llenar la tabla con los valores de la tabla BD
** el * determina que se traiga todos loc valores de todas las columnas y sobreescribe en la tabla anterior dado que tienen el mismo nombre @nomtab1
** como se creo una tabla siguiendo el formato de ZDEL_PARTNER debo coocar los valores numeriocs en la columna 12, por ende se usa la insteuccionm corresponding of table

DATA: nuv_tabcol LIKE pgg_mm.

LOOP AT pgg_mm INTO estpgg_mm.
  curr_var = estpgg_mm-curr.
** if(cur = usd, curr, IF (curr = eur, curr / '0.88', if(curr = mxn, curr / '17.51')
** VER curr_var = estpgg_mm-curr. / se usa esta instrucción para evitar colocarla orden en cada variable
  IF curr_var = 'MXN'.
** VER curr_var = estpgg_mm-curr. / se usa esta instrucción para evitar colocarla orden en cada variable
** IF estpgg_mm-curr = 'mxn'. / este metodo tambien da el resùltado pero se tendría que hacer con cada varibles
** SAP reconoce la diff entre mayus y minus y en caso de que la tabla tenga mayus o minus se debe de homologar
    estpgg_mm-total = estpgg_mm-total / '17.51'.
  ELSEIF curr_var = 'EUR'.
** VER curr_var = estpgg_mm-curr. / se usa esta instrucción para evitar colocarla orden en cada variable
** ELSEIF estpgg_mm-curr = 'eur'. / este metodo tambien da el resùltado pero se tendría que hacer con cada varibles
** SAP reconoce la diff entre mayus y minus y en caso de que la tabla tenga mayus o minus se debe de homologar
    estpgg_mm-total = estpgg_mm-total / '0.88'.
  ENDIF.

  estpgg_mm-curr = 'USD'.
** esta instrucción lo que hace es reemplazar el concepto original de MXN y EUR dado que al saldo ya paso a USD
** se coloca afuera para que convierta tanto el MXN y EUR a USD y evitar colocar la instruccion dos veces abajo de MXN y EUR

*** Este codigo es para realizar el conteo de bonos, es decir los que sean superior a 1000 = 100 o en su caso den 50
  IF balance_sheet_usd_var >= '20000' OR indiceusd >= 50.
    EXIT.
  ENDIF.
  IF estpgg_mm-total >= '1000'.
** esta pendiente
    estpgg_mm-bono = ( estpgg_mm-total / '1000' ) * '100'.
** balance_sheet_usd_var = ( estpgg_mm-total / '1000' ) * '100'. >>> se debe de cambiar el nombre de lavaribale
** por "estpgg_mm-bono"
    indiceusd = indiceusd + '1'.
    balance_sheet_usd_var = balance_sheet_usd_var + estpgg_mm-bono.
** la variable USD BS es equivalente a la misma variable + el saldo del renglon 1 de bono y esto se repite con cada renglon
    APPEND estpgg_mm TO nuv_tabcol.
** al estar por fuera de la funcion IF <-> ENDIF agrega el resultado pero no se contabiliza lo que no cumpla la condición
** para eliminar de la tabla finaL lo no contabilizado se debe colocar preferntemente despues del proceso, es decir, despues de las condiciones
  ENDIF.

**  APPEND estpgg_mm TO nuv_tabcol.
** al estar por fuera de la funcion IF <-> ENDIF agrega el resultado pero no se contabiliza lo que no cumpla la condición
** para eliminar de la tabla finaL lo no contabilizado se debe colocar preferntemente
ENDLOOP.
cl_demo_output=>display( nuv_tabcol ).

**IF(SUM(D2:D4)>=600,SUM(D2:D4),COUNT(D2:D4))


*name
*zip_code
*balance_sheet
*curr

WRITE: 'PG_MM'.
