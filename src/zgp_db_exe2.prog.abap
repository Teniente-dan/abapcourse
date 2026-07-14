*&---------------------------------------------------------------------*
*& Report ZGP_DB_EXE2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgp_db_exe2.

*De la tabla Zgp_demo marcar los registros que
*tengan menos de 5 semestres cumplidos, poner x en la columna mandt

*TABLA
DATA: demo_tab TYPE STANDARD TABLE OF zgp_demo.
*Estructura
DATA: demo_est TYPE zgp_demo.

*Se llena la tabla del programa con informacion de DB
SELECT * FROM zgp_demo INTO TABLE demo_tab.

*Declaramos nueva tabla para almacenar los valores modificados
DATA: demo_tab_2 LIKE demo_tab.

LOOP AT demo_tab INTO demo_est.
*tengan menos de 5 semestres cumplidos
  IF demo_est-semestre < 5.
*poner x en la columna mandt.
    demo_est-mandt = 'X'.
  ELSE.
*de loc ontrario poner yyy en la columna mandt.
    demo_est-mandt = 'YYY'.
  ENDIF.
*llenamos nueva tabla con datos modificados
  APPEND demo_est TO demo_tab_2.
ENDLOOP.
cl_demo_output=>display( demo_tab_2 ).
