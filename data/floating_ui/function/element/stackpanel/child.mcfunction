#遍历子元素
scoreboard players set temp.childCount floating_ui.temp 0
execute if data storage floating_ui:input temp.child.data run data modify storage floating_ui:temp child append from storage floating_ui:input temp.child.data
execute unless data storage floating_ui:input temp.child.data run data modify storage floating_ui:temp child append from storage floating_ui:input temp.child
data modify storage floating_ui:temp cache append from storage floating_ui:input temp
scoreboard players set @s floating_ui.child_z 10
data modify entity @s item.components.minecraft:custom_data.data.childPoint set value []
execute if data storage floating_ui:input temp.child run function floating_ui:element/stackpanel/add_child
data modify storage floating_ui:input temp set from storage floating_ui:temp cache[-1]
data remove storage floating_ui:temp cache[-1]
execute if data storage floating_ui:input temp.child run data remove storage floating_ui:temp child[-1]