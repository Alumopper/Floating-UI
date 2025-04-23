#> floating_ui:element/stackpanel/_new
# 创建一个新的stackpanel。
# @internal
# @input storage floating_ui:input 要创建的ui的内容信息

data modify storage floating_ui:debug curr prepend value "floating_ui:element/stackpanel/_new"
function floating_ui:element/control/_new

#
tag @s add floating_ui_stackpanel

#region 属性设置

#设置高度和宽度
execute unless data storage floating_ui:input temp.size run function floating_ui:element/stackpanel/util/auto_size

#遍历子元素
scoreboard players set temp.childCount _ 0
execute if data storage floating_ui:input temp.child run data modify storage floating_ui:temp child append from storage floating_ui:input temp.child
data modify storage floating_ui:temp cache append from storage floating_ui:input temp
scoreboard players set @s floating_ui.child_z 10
data modify entity @s item.components.minecraft:custom_data.data.childPoint set value []
execute if data storage floating_ui:input temp.child run function floating_ui:element/stackpanel/add_child
data modify storage floating_ui:input temp set from storage floating_ui:temp cache[-1]
data remove storage floating_ui:temp cache[-1]
execute if data storage floating_ui:input temp.child run data remove storage floating_ui:temp child[-1]
scoreboard players operation @s floating_ui.list.childCount = temp.childCount _

#高度和宽度
execute store result score @s floating_ui.size0_without_scale store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1_without_scale store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000

#初次更新列表中的内容
scoreboard players set @s floating_ui.list.index 0
scoreboard players set selected_index _ 0
scoreboard players set @s floating_ui.list.maxIndex 1
scoreboard players set @s floating_ui.list.minIndex 0
execute on passengers unless score @s floating_ui.list.childIndex = selected_index _ run function floating_ui:element/stackpanel/update_e_view/change_size
function floating_ui:element/stackpanel/update_e_view

#endregion
data remove storage floating_ui:debug curr[0]