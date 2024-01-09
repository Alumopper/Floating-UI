#> floating_ui:element/stackpanel/_dispose
# @internal
data modify storage floating_ui:debug curr prepend value "floating_ui:element/stackpanel/_dispose"
#删除子节点
function floating_ui:element/stackpanel/dispose_child
#删除自己
kill @s
data remove storage floating_ui:debug curr[0]