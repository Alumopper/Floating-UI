#> floating_ui:element/button/_new
# 创建一个新的button。
#
# @input storage floating_ui:input 要创建的ui的内容信息

data modify storage floating_ui:debug curr prepend value "floating_ui:element/button/_new"
function floating_ui:element/control/_new

tag @s add floating_ui_button

#点击事件
execute if data storage floating_ui:input temp.click run data modify entity @s item.components.minecraft:custom_data.data.click set from storage floating_ui:input temp.click
data remove storage floating_ui:debug curr[0]

#设置内容
function floating_ui:element/button/set_content

#高度和宽度
execute store result score @s floating_ui.size0_without_scale store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1_without_scale store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000