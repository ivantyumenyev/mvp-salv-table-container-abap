# MODEL-VIEW-PRESENTER pattern using CL_SALV_TABLE based on object oriented ABAP
Code example for MVP pattern.

Create ABAP report, for example **ZTEST_ALV**, with few includes:
```
INCLUDE:
  ztest_alv_app_model,
  ztest_alv_app_view,
  ztest_alv_app_presenter,
  ztest_alv_app_top,
  ztest_alv_app_sel,
  ztest_alv_app_scr_0100.
```
  
Create dynpro screen **0100** and place container **MAIN_CONTAINER** on it. Add screen flow logic for this screen:
```
PROCESS BEFORE OUTPUT.
 MODULE STATUS_0100.

PROCESS AFTER INPUT.
 MODULE USER_COMMAND_0100.
 MODULE EXIT_USER_COMMAND_0100 AT EXIT-COMMAND.
 ```

Also you need to have GUI Status **0100** and GUI Title **0100**.
