*&---------------------------------------------------------------------*
*& Include          ZTEST_ALV_APP_TOP
*&---------------------------------------------------------------------*
DATA:
  gv_matnr     TYPE matnr,
  go_0100_view TYPE REF TO lcl_view.

CLASS lcx_exception DEFINITION INHERITING FROM cx_static_check.
  PUBLIC SECTION.
    INTERFACES if_t100_message.
ENDCLASS.
