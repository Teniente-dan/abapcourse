*&---------------------------------------------------------------------*
*& Report ZGP_DB_EXE1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgp_db_exe1.

**De la tabla ZDEL_PARTNER encuentra los registros
**que tenga ZIP_CODE mayor a 50000 y muestralos en una tabla,
**y agrega el indice en una columna
*
**opcion1 para crea tabla
**declaracion de estructura
*DATA: nombre TYPE zdel_partner.
*DATA: nombres_op1 LIKE STANDARD TABLE OF nombre.
*
**opcion2 para crea tabla
**DATA: nombres_op2 TYPE STANDARD TABLE OF zdel_partner.
*
*
*
*
**Seleccion a base de datos
*SELECT * FROM zdel_partner INTO TABLE nombres_op1
*  WHERE zip_code BETWEEN '50000' AND '65000'.
**   ORDER BY name ASCENDING.
*
*DATA: indice TYPE i.
*LOOP AT nombres_op1 ASSIGNING FIELD-SYMBOL(<fs>).
*  indice = indice + 1.
*  <fs>-mandt = indice.
*ENDLOOP.
*CLEAR indice.
*
*DATA: tabclone LIKE nombres_op1.
*LOOP AT nombres_op1 INTO DATA(linea).
*  indice = indice + 1.
*  linea-mandt = indice.
*  APPEND linea TO tabclone.
*ENDLOOP.
*
*cl_demo_output=>display( tabclone ).
*
*
*
*
*
*DATA: total TYPE i,
*      total1 like total.
*total = lines( nombres_op1 ).
*
*cl_demo_output=>display( nombres_op1 ).
*cl_demo_output=>display( total ).
*
*
*write: total.


DATA: demo_tab TYPE STANDARD TABLE OF zgp_demo.
DATA: demo_est LIKE LINE OF demo_tab.

demo_est-mandt = '001'.
demo_est-student_id = '004DDF9E-0DA2-4DDC-9C14-5DA3990F5CE1'.
demo_est-name = 'Carlos'.
demo_est-surname = 'Guzman'.
demo_est-universidad = 'UNAM'.
demo_est-calificacion = '92.45'.
demo_est-semestre = 9.
demo_est-zip_code = '11320'.
APPEND demo_est TO demo_tab.

demo_est-mandt = '001'.
demo_est-student_id = '005DDF9E-0DA2-4DDC-9C14-5DA3990F5CE1'.
demo_est-name = 'Miguel'.
demo_est-surname = 'Guzman'.
demo_est-universidad = 'UVM'.
demo_est-calificacion = '96.45'.
demo_est-semestre = 6.
demo_est-zip_code = '55320'.
APPEND demo_est TO demo_tab.

demo_est-mandt = '001'.
demo_est-student_id = '006DDF9E-0DA2-4DDC-9C14-5DA3990F5CE1'.
demo_est-name = 'Luis'.
demo_est-surname = 'Lopez'.
demo_est-universidad = 'UVM'.
demo_est-calificacion = '67.45'.
demo_est-semestre = 4.
demo_est-zip_code = '53456'.
APPEND demo_est TO demo_tab.

demo_est-mandt = '001'.
demo_est-student_id = '007DDF9E-0DA2-4DDC-9C14-5DA3990F5CE1'.
demo_est-name = 'Ramon'.
demo_est-surname = 'Tomas'.
demo_est-universidad = 'IPN'.
demo_est-calificacion = '86.45'.
demo_est-semestre = 7.
demo_est-zip_code = '65654'.
APPEND demo_est TO demo_tab.

demo_est-mandt = '001'.
demo_est-student_id = '008DDF9E-0DA2-4DDC-9C14-5DA3990F5CE1'.
demo_est-name = 'Lupe'.
demo_est-surname = 'Gonzalez'.
demo_est-universidad = 'UAM'.
demo_est-calificacion = '81'.
demo_est-semestre = 2.
demo_est-zip_code = '55320'.
APPEND demo_est TO demo_tab.

*modificar db desde estructura
*MODIFY zgp_demo FROM demo_est.

*modificar db desde tabla
MODIFY zgp_demo FROM TABLE demo_tab.
