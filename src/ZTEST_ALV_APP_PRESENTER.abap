*&---------------------------------------------------------------------*
*& Include          ZTEST_ALV_APP_PRESENTER
*&---------------------------------------------------------------------*
CLASS lcl_presenter DEFINITION.
  PUBLIC SECTION.
*    CONSTANTS:
*    TYPES:
    METHODS:
      constructor
        IMPORTING
          io_model TYPE REF TO lcl_model
          io_view  TYPE REF TO lcl_view,
      run RETURNING VALUE(ro_instance) TYPE REF TO lcl_presenter,
      on_add_custom_material FOR EVENT add_custom_material OF lcl_view,
      on_drill_down_material FOR EVENT drill_down_material OF lcl_view
        IMPORTING ev_index.

  PRIVATE SECTION.
*    TYPES:
    DATA:
      mo_model TYPE REF TO lcl_model,
      mo_view  TYPE REF TO lcl_view.
ENDCLASS.

CLASS lcl_presenter IMPLEMENTATION.
  METHOD constructor.
    mo_model = io_model.
    mo_view = io_view.
  ENDMETHOD.

  METHOD run.
    ro_instance = me.
    DATA(lt_materials) = mo_model->read_materials(
      )->get_materials( ).
    ASSIGN lt_materials->* TO FIELD-SYMBOL(<lt_materials>).

    mo_view->setup_materials_grid(
      CHANGING ct_materials = <lt_materials> ).

    SET HANDLER on_add_custom_material FOR mo_view.
    Set HANDLER on_drill_down_material FOR mo_view.

    CALL SCREEN 0100.
  ENDMETHOD.

  METHOD on_add_custom_material.
    mo_model->add_custom_material( ).
  ENDMETHOD.

  METHOD on_drill_down_material.
    DATA(lt_materials) = mo_model->get_materials( ).
    DATA(lv_matnr) = lt_materials->*[ ev_index ]-matnr.

    SET PARAMETER ID 'MAT' FIELD lv_matnr.
    CALL TRANSACTION 'MM03' AND SKIP FIRST SCREEN.
  ENDMETHOD.
ENDCLASS.
