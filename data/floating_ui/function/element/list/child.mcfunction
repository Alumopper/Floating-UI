scoreboard players set temp.childCount _ 0
execute if data storage floating_ui:input temp.child.data run data modify storage floating_ui:temp child append from storage floating_ui:input temp.child.data
execute unless data storage floating_ui:input temp.child.data run data modify storage floating_ui:temp child append from storage floating_ui:input temp.child
data modify storage floating_ui:temp cache append from storage floating_ui:input temp
scoreboard players set @s floating_ui.child_z 10
data modify entity @s item.components.minecraft:custom_data.data.childPoint set value []
function floating_ui:element/list/add_child
data modify storage floating_ui:input temp set from storage floating_ui:temp cache[-1]
data remove storage floating_ui:temp cache[-1]
execute if data storage floating_ui:input temp.child run data remove storage floating_ui:temp child[-1]
scoreboard players operation @s floating_ui.list.childCount = temp.childCount _ 

#初次更新列表中的内容
scoreboard players set @s floating_ui.list.index 0
scoreboard players set selected_index _ 0
scoreboard players set @s floating_ui.list.maxIndex 1
scoreboard players set @s floating_ui.list.minIndex 0
execute on passengers unless score @s floating_ui.list.childIndex = selected_index _ run function floating_ui:element/list/update_e_view/change_size

scoreboard players set isUpdate _ 0

function floating_ui:element/list/update_e_view