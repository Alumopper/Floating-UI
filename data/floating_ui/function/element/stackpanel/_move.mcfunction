#> floating_ui:element/stackpanel/_move
# 移动控件
# @api

data modify storage floating_ui:debug curr prepend value "floating_ui:element/stackpanel/_dispose"

function floating_ui:element/control/_move
#移动子节点
function floating_ui:element/stackpanel/move_child

data remove storage floating_ui:debug curr[0]