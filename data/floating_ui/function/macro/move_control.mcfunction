#> floating_ui:macro/move_control
# @with type 控件的种类
# @internal


scoreboard players set #exist floating_ui.temp 1
$execute store success score #exist floating_ui.temp run function floating_ui:element/$(type)/_move
$execute if score #exist floating_ui.temp matches 0 run function floating_ui:util/_error_track {"ex":"NoSuchFunctionException","msg":"No such function: floating_ui:element/$(type)/_move"}
