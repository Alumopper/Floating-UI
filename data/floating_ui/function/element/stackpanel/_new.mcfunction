#> floating_ui:element/stackpanel/_new
# 创建一个新的stackpanel。
# @internal
# @input storage floating_ui:input 要创建的ui的内容信息


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

function floating_ui:element/stackpanel/auto_layout/init/floating_ui.temp

#数据模板
execute if data storage floating_ui:input temp.child.binds if data storage floating_ui:input temp.template run function floating_ui:element/stackpanel/template/append_template

#遍历子元素
execute if data storage floating_ui:input temp.child[0] run function floating_ui:element/stackpanel/child

#endregion
