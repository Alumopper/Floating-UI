#> floating_ui:element/stackpanel/_new
# 创建一个新的stackpanel。
# @internal
# @input storage floating_ui:input 要创建的ui的内容信息

data modify storage floating_ui:debug curr prepend value "floating_ui:element/stackpanel/_new"
function floating_ui:element/control/_new

#
tag @s add floating_ui_stackpanel

#region 属性设置


#间隙
execute unless data storage floating_ui:input temp.gap run data modify storage floating_ui:input temp.gap set value 0
execute store result score @s floating_ui.stackpanel.gap run data modify entity @s item.components."minecraft:custom_data".data.gap set from storage floating_ui:input temp.gap

#对齐方式
execute unless data storage floating_ui:input temp.align run data modify storage floating_ui:input temp.align set value "left"
data modify entity @s item.components."minecraft:custom_data".data.align set from storage floating_ui:input temp.align
function floating_ui:element/stackpanel/util/get_align_id

#高度和宽度
execute store result score @s floating_ui.size0_without_scale store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1_without_scale store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000

scoreboard players set @s floating_ui.stackpanel.currLineHeight 0
scoreboard players set @s floating_ui.stackpanel.currLineWidth 0

function floating_ui:element/stackpanel/auto_layout/init/_

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

#endregion
data remove storage floating_ui:debug curr[0]