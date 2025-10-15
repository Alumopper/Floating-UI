#> floating_ui:element/panel/_new
# 创建一个新的panel。
# @internal
# @input storage floating_ui:input 要创建的ui的内容信息


function floating_ui:element/control/_new

#
tag @s add floating_ui_panel

#region 属性设置

#遍历子元素
execute if data storage floating_ui:input temp.child run data modify storage floating_ui:temp child append from storage floating_ui:input temp.child
data modify storage floating_ui:temp cache append from storage floating_ui:input temp
scoreboard players set @s floating_ui.child_z 10
data modify entity @s item.components.minecraft:custom_data.data.childPoint set value []
execute if data storage floating_ui:input temp.child run function floating_ui:element/panel/add_child
data modify storage floating_ui:input temp set from storage floating_ui:temp cache[-1]
data remove storage floating_ui:temp cache[-1]
execute if data storage floating_ui:input temp.child run data remove storage floating_ui:temp child[-1]
#
#高度和宽度
execute store result score @s floating_ui.size0_without_scale store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1_without_scale store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000
#endregion
