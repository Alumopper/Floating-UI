#> floating_ui:element/sprite/_new
# 创建一个新的sprite。
# @internal
# @input storage floating_ui:input 要创建的ui的内容信息


function floating_ui:element/control/_new

#
tag @s add floating_ui_sprite

#region 属性设置
#高度和宽度
execute store result score @s floating_ui.size0_without_scale store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1_without_scale store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000
#endregion
