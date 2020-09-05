*&---------------------------------------------------------------------*
*& Include          ZTEST_ALV_APP_VIEW
*&---------------------------------------------------------------------*
CLASS lcl_view DEFINITION.
  PUBLIC SECTION.
*    CONSTANTS:
*    TYPES:
    METHODS:
      constructor,
      setup_materials_grid
        CHANGING  ct_materials       TYPE table
        RETURNING VALUE(ro_instance) TYPE REF TO lcl_view,
      add_custom_material_button
        RETURNING VALUE(ro_instance) TYPE REF TO lcl_view,
      on_link_click FOR EVENT link_click OF cl_salv_events_table
        IMPORTING row column.
    EVENTS:
      add_custom_material,
      drill_down_material EXPORTING VALUE(ev_index) TYPE i.

  PRIVATE SECTION.
    CONSTANTS:
      BEGIN OF ns_material_fields,
        mat_number TYPE lvc_fname VALUE 'MATNR',
      END OF ns_material_fields.
*    TYPES:
    DATA:
      mo_container      TYPE REF TO cl_gui_custom_container,
      mo_materials_grid TYPE REF TO cl_salv_table.
ENDCLASS.

CLASS lcl_view IMPLEMENTATION.
  METHOD constructor.
    mo_container = NEW #( container_name = 'MAIN_CONTAINER' ).
  ENDMETHOD.

  " Setup materials grid
  METHOD setup_materials_grid.
    ro_instance = me.

    cl_salv_table=>factory(
      EXPORTING
        r_container    = mo_container
        container_name = 'MAIN_CONTAINER'
      IMPORTING
        r_salv_table   = mo_materials_grid
      CHANGING
        t_table        = ct_materials ).

    mo_materials_grid->get_functions( )->set_all( ).
    mo_materials_grid->get_selections(
      )->set_selection_mode( if_salv_c_selection_mode=>row_column ).

    DATA(lo_columns) = mo_materials_grid->get_columns( ).
    lo_columns->apply_ddic_structure( 'MARA' ).

    CAST cl_salv_column_table( lo_columns->get_column( ns_material_fields-mat_number
      ) )->set_cell_type( if_salv_c_cell_type=>hotspot ).
    SET HANDLER on_link_click FOR mo_materials_grid->get_event( ).

    mo_materials_grid->get_display_settings( )->set_striped_pattern( abap_true ).

    mo_materials_grid->display( ).
  ENDMETHOD.

  " Press button Add custom material
  METHOD add_custom_material_button.
    RAISE EVENT add_custom_material.
    mo_materials_grid->refresh( ).
  ENDMETHOD.

  " Link click
  METHOD on_link_click.
    CASE column.
      WHEN ns_material_fields-mat_number.
        RAISE EVENT drill_down_material EXPORTING ev_index = row.
      WHEN OTHERS.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
