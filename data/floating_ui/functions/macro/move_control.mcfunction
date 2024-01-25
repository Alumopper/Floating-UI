#> floating_ui:macro/move_control
# @with type 控件的种类
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:macro/move_control"
$execute as 1bf52-0-0-0-2 on origin run function floating_ui:element/$(type)/_move
data remove storage floating_ui:debug curr[0]