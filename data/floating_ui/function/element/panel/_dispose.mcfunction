#> floating_ui:element/panel/_dispose
# @internal
data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/_dispose"
#删除子节点
function floating_ui:element/panel/dispose_child
#删除自己
kill @s
data remove storage floating_ui:debug curr[0]