*&---------------------------------------------------------------------*
*& Report ZPG_SNOOPY2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zpg_snoopy2.

DATA: BEGIN OF perrito,
        nombre TYPE string,
        edad   TYPE string,
        kilos  TYPE p DECIMALS 2 LENGTH 4,
      END OF perrito.

DATA: inventario_de_perritos LIKE TABLE OF perrito.

perrito-nombre = 'MAR'.
perrito-edad = 'NUEVE'.
perrito-kilos = 12.
INSERT perrito INTO TABLE inventario_de_perritos.


perrito-nombre = 'TOMAS'.
perrito-edad = '2.5'.
perrito-kilos = 14.
INSERT perrito INTO TABLE inventario_de_perritos.

perrito-nombre = 'ESKUI37'.
perrito-edad = '3'.
perrito-kilos = '55.2'.
INSERT perrito INTO TABLE inventario_de_perritos.

perrito-nombre = 'SNOOPY'.
perrito-edad = '105'.
perrito-kilos = 10.
INSERT perrito INTO TABLE inventario_de_perritos.
cl_demo_output=>display( perrito  ).
*CLEAR perrito.
INSERT perrito INTO TABLE inventario_de_perritos.
CLEAR perrito.
cl_demo_output=>display( perrito  ).
cl_demo_output=>display( inventario_de_perritos  ).
