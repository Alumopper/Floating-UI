#> floating_ui:element/stackpanel/_add
# @api
# @input floating_ui:input element UI数据

#父节点替换
data modify entity 0-0-0-0-2 Thrower set from entity @s UUID

execute store success score panelqwq _ run data modify storage floating_ui:input element.type set value "textblock"
execute if score panelqwq _ matches 1 summon item_display run function floating_ui:_new_control with storage floating_ui:input element
execute unless score panelqwq _ matches 1 summon marker run function floating_ui:_new_control with storage floating_ui:input element

scoreboard players add @s floating_ui.child_z 10