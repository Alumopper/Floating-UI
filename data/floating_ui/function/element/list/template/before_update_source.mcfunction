#floating_ui:temp binding
#{path: xxx, value: xxx}
data modify storage floating_ui:input temp.template set from entity @s item.components."minecraft:custom_data".data.ui.template
data modify storage floating_ui:input temp.child.binds set from entity @s item.components."minecraft:custom_data".data.ui.child.binds
data modify storage floating_ui:input temp.child.value set from storage floating_ui:temp binding.value
# 移除已有的所有子控件
#删除子节点
execute on passengers run function floating_ui:dispose_control with entity @s item.components.minecraft:custom_data.data.ui

scoreboard players set isUpdate floating_ui.temp 1
#更新源
function floating_ui:element/list/template/update_source

scoreboard players set isUpdate floating_ui.temp 0