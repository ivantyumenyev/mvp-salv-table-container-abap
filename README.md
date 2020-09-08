# ALV Grid report based on Model-View-Presenter pattern

MVP code example using **CL_SALV_TABLE** with Dynpro screen and container. Based on object oriented ABAP.

![ALV grid screen.png](/images/ALV_grid_screen.png)

# Model-View-Presenter
**Model–view–presenter (MVP)** is a derivation of the model–view–controller (MVC) architectural pattern, and is used mostly for building user interfaces.
In MVP, the presenter assumes the functionality of the "middle-man". In MVP, all presentation logic is pushed to the presenter.

![Model_View_Presenter.png](/images/Model_View_Presenter.png)

# Report structure
Create ABAP report, for example **ZTEST_ALV**, with few includes:
```abap
INCLUDE:
  ztest_alv_app_model,
  ztest_alv_app_view,
  ztest_alv_app_presenter,
  ztest_alv_app_top,
  ztest_alv_app_sel,
  ztest_alv_app_scr_0100.
```

# Screen
Create dynpro screen **0100** and place container **MAIN_CONTAINER** on it. 

![0100 Screen](/images/0100_screen.png)


Also you need to have GUI Status **0100** and GUI Title **0100**.

![0100 GUI Status](/images/0100_gui_status.png)


Add screen flow logic for this screen:
```abap
PROCESS BEFORE OUTPUT.
 MODULE STATUS_0100.

PROCESS AFTER INPUT.
 MODULE USER_COMMAND_0100.
 MODULE EXIT_USER_COMMAND_0100 AT EXIT-COMMAND.
 ```
