@startuml
title Conditional - Activity Diagram 

start
:The user forms and submits his architectural project;
:The administrator checks the correctness and expediency of the project;
if (Is the project formed correctly?) then (Yes)
  :The project has been published!;
else (No)
  :The project is formed incorrectly!;
endif
stop

@enduml


