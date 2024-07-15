#> floating_ui:element/panel/_add
# @api
# @input floating_ui:input element UI数据

#父节点替换
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID

execute summon item_display run function floating_ui:_new_control with storage floating_ui:input element

scoreboard players add @s floating_ui.child_z 10