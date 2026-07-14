*&---------------------------------------------------------------------*
*& Report ZGP_TESTO1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgp_testo1.


** KB, 28, UNAM y Arq
** AC, 26, INBA y Sop
** XI, 33, UNAM y Dis
** KD, 35, EBC y Con
** NM, 37, IPN y Vir

DATA: BEGIN OF alumno,
        nombre  TYPE c LENGTH 2,
        edad    TYPE i,
        ecuela  TYPE string,
        materia TYPE c LENGTH 3,
      END OF alumno.

*TYPES: nombre_de_nuevo_tipo TYPE tipo existente o tipo primitivo
TYPES: nuevo_tipo TYPE string.

*DATA: nombre_variable TYPE nombre_tipo.
*TYPE siempre espera un nombre de tipo. No crean variables. Solo crea definiciones
DATA: nueva_variable TYPE nuevo_tipo.

*LIKE siempre espera un nombre variable ya declarada
DATA: nueva_variable_2 LIKE nueva_variable.

*opcion 1:
TYPES: tipo_alumno LIKE alumno.
DATA: alumnos_op1 TYPE STANDARD TABLE OF tipo_alumno.

*opcion 2:
DATA: alumnos_op2 LIKE STANDARD TABLE OF alumno.

*llenar estructura con datos:
alumno-nombre = 'KB'.
alumno-edad = 28.
alumno-ecuela = 'UNAM'.
alumno-materia = 'Arq'.
INSERT alumno INTO TABLE alumnos_op1.

alumno-nombre = 'AC'.
alumno-edad = 26.
alumno-ecuela = 'INBA'.
alumno-materia = 'Sop'.
INSERT alumno INTO TABLE alumnos_op1.

alumno-nombre = 'XI'.
alumno-edad = 33.
alumno-ecuela = 'UNAM'.
alumno-materia = 'Dis'.
INSERT alumno INTO TABLE alumnos_op1.

alumno-nombre = 'KD'.
alumno-edad = 35.
alumno-ecuela = 'EBC'.
alumno-materia = 'Con'.
INSERT alumno INTO TABLE alumnos_op1.

alumno-nombre = 'NM'.
alumno-edad = 37.
alumno-ecuela = 'IPN'.
alumno-materia = 'Vir'.
INSERT alumno INTO TABLE alumnos_op1.

alumno-nombre = ''.
alumno-edad = 0.
alumno-ecuela = ''.
alumno-materia = ''.
INSERT alumno INTO TABLE alumnos_op1.

cl_demo_output=>display( alumnos_op1 ).
