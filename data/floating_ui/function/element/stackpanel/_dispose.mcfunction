#> floating_ui:element/list/_dispose
# @internal
data modify storage floating_ui:debug curr prepend value "floating_ui:element/list/_dispose"
#删除子节点
execute on passengers run function floating_ui:dispose_control with entity @s item.components.minecraft:custom_data.data.ui
#删除自己
kill @s
data remove storage floating_ui:debug curr[0]