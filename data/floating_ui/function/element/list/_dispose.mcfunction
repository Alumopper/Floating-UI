#> floating_ui:element/list/_dispose
# @internal

#删除子节点
execute on passengers run function floating_ui:dispose_control with entity @s item.components.minecraft:custom_data.data.ui
#删除自己
kill @s
