CLASS zcl_cagp_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_amount TYPE p LENGTH 16 DECIMALS 2.

    CLASS-METHODS apply_tax
      IMPORTING
        !amount                TYPE ty_amount
      RETURNING
        VALUE(amount_with_tax) TYPE ty_amount.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CAGP_DEMO IMPLEMENTATION.


  METHOD apply_tax.
    amount_with_tax = amount * '1.16'.
  ENDMETHOD.
ENDCLASS.
