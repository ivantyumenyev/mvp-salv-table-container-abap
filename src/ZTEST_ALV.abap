REPORT ZTEST_ALV.

INCLUDE:
  ztest_alv_app_model,
  ztest_alv_app_view,
  ztest_alv_app_presenter,
  ztest_alv_app_top,
  ztest_alv_app_sel,
  ztest_alv_app_scr_0100.

START-OF-SELECTION.
  go_0100_view = NEW lcl_view( ).

  DATA(go_presenter) = NEW lcl_presenter(
    io_model = NEW lcl_model( s_matnr[] )
    io_view  = go_0100_view )->run( ).
