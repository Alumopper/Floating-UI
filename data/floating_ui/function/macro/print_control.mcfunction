#> floating_ui:macro/print_control
# @with type 控件的种类
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:macro/print_control"
scoreboard players set #exist _ 1
$execute store success score #exist _ run function floating_ui:element/$(type)/_print with storage floating_ui:temp arg
$execute if score #exist _ matches 0 run function floating_ui:util/_error_track {"ex":"NoSuchFunctionException","msg":"No such function: floating_ui:element/$(type)/_print"}
data remove storage floating_ui:debug curr[0]