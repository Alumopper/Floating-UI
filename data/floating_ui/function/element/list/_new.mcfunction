#> floating_ui:element/list/_new
# 创建一个新的list。
# @internal
# @input storage floating_ui:input 要创建的ui的内容信息

data modify storage floating_ui:debug curr prepend value "floating_ui:element/list/_new"
function floating_ui:element/control/_new

#
tag @s add floating_ui_list

#region 属性设置

#设置高度和宽度
execute unless data storage floating_ui:input temp.size run function floating_ui:element/list/util/auto_size

#遍历子元素
scoreboard players set temp.childCound _ 0
execute if data storage floating_ui:input temp.child run data modify storage floating_ui:temp child append from storage floating_ui:input temp.child
data modify storage floating_ui:temp cache append from storage floating_ui:input temp
scoreboard players set @s floating_ui.child_z 10
data modify entity @s item.components.minecraft:custom_data.data.childPoint set value []
execute if data storage floating_ui:input temp.child run function floating_ui:element/list/add_child
data modify storage floating_ui:input temp set from storage floating_ui:temp cache[-1]
data remove storage floating_ui:temp cache[-1]
execute if data storage floating_ui:input temp.child run data remove storage floating_ui:temp child[-1]

#高度和宽度
execute store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000
#endregion
data remove storage floating_ui:debug curr[0]