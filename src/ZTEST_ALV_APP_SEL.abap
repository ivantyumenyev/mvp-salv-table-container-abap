*&---------------------------------------------------------------------*
*& Include          ZTEST_ALV_APP_SEL
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK bl1 WITH FRAME.
  SELECT-OPTIONS s_matnr FOR gv_matnr OBLIGATORY.
SELECTION-SCREEN END OF BLOCK bl1.
