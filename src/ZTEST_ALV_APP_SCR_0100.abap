*&---------------------------------------------------------------------*
*& Include          ZTEST_ALV_APP_SCR_0100
*&---------------------------------------------------------------------*

MODULE status_0100 OUTPUT.
  SET PF-STATUS '0100'.
  SET TITLEBAR '0100'.
ENDMODULE.

MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'ADDCUSTMAT'.
      go_0100_view->add_custom_material_button( ).
    WHEN OTHERS.
  ENDCASE.
ENDMODULE.

MODULE exit_user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK' OR 'CANCEL'.
      LEAVE TO SCREEN 0.
    WHEN 'EXIT'.
      LEAVE PROGRAM.
    WHEN OTHERS.
  ENDCASE.
ENDMODULE.
