*&---------------------------------------------------------------------*
*& Report ZGP_DB_EXE3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgp_db_exe3.



DATA: lv_score  TYPE i VALUE 1,
      lv_score2 LIKE lv_score value 1,
      lv_grade  TYPE string.
*cada iteracion se revisa si la condicion se cumple

WHILE ( lv_score + lv_score2 ) <= 150.
  IF lv_score <= 25.
    lv_grade = 'Failing'.
  ELSEIF lv_score <= 50.
    lv_grade = 'Passing'.
  ELSEIF lv_score <= 75.
    lv_grade = 'Good'.
  ELSE.
**lv_score = lv_score - 25.
    lv_grade = 'Excellent'.
  ENDIF.

  WRITE: / 'Score:', lv_score, '| Grade:', lv_grade.
  lv_score = lv_score + 25.
ENDWHILE.



DATA: lv_result TYPE string.
*Se establece un numero de iteraciones directamente
DO 10 TIMES.
* sy-index pertenece a la estructura sy
  IF sy-index <= 3.
    lv_result = 'Low'.
  ELSEIF sy-index <= 6.
    lv_result = 'Medium'.
  ELSEIF sy-index <= 8.
    lv_result = 'High'.
  ELSE.
    lv_result = 'Very High'.
  ENDIF.
  WRITE: / 'Iteration:', sy-index, '| Range:', lv_result.
** que escriba iteración y que le ponga el valor resultsante del sy-index, despues que escriba
** |Rango y que ponga el valor asignado de la condición
ENDDO.


DATA: lv_cycle  TYPE i VALUE 1,
      iteracion TYPE i.
*Se establece un numero de iteraciones por medio de variable
iteracion = 53.
DO iteracion TIMES.
** realizar la operación el número de veces del valor de la variable
  IF lv_cycle >= 31.
    EXIT.  " Breaks out of the loop
  ENDIF.
  WRITE: / 'Number cycle:', lv_cycle.
  lv_cycle = lv_cycle + 1.
ENDDO.


DATA: lv_num TYPE i VALUE 1.
*Las iteraciones son libres hasta terminar el bucle explicitamente
DO.
  IF lv_num > 71.
    EXIT.  " Breaks out of the loop
  ENDIF.
  WRITE: / 'Number:', lv_num.
  lv_num = lv_num + 1.
ENDDO.
