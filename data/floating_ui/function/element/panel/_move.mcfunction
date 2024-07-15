#> floating_ui:element/panel/_move
# 移动控件
# @api

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/_dispose"

function floating_ui:element/control/_move
#移动子节点
execute on passengers run function floating_ui:element/panel/move_child

data remove storage floating_ui:debug curr[0]