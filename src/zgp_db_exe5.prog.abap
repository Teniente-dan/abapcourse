*&---------------------------------------------------------------------*
*& Report ZGP_DB_EXE5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgp_db_exe5.


SELECT * FROM zdel_partner INTO TABLE @DATA(partner).

DATA: currs TYPE RANGE OF zdel_partner-curr.

currs = VALUE #(
( low = 'USD' )
( low = 'MXN' )
( low = 'EUR' )
).



DATA: lv_random TYPE i,
      lo_rnd    TYPE REF TO cl_abap_random_int,
      lo_rnd2   TYPE REF TO cl_abap_random_decfloat16.

lo_rnd = cl_abap_random_int=>create(
  seed = CONV i( sy-uzeit )
  min  = 1
  max  = 3
).

lo_rnd2 = cl_abap_random_decfloat16=>create(
  seed = CONV i( sy-uzeit )
).


LOOP AT partner ASSIGNING FIELD-SYMBOL(<fs>).
  <fs>-total = lo_rnd2->get_next( ) * 10000.
  <fs>-curr = currs[ lo_rnd->get_next( ) ]-low.
ENDLOOP.

MODIFY zdel_partner FROM TABLE partner.
COMMIT WORK.
