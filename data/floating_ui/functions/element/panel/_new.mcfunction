#> floating_ui:element/panel/_new
# 创建一个新的panel。
# @internal
# @input storage floating_ui:input 要创建的ui的内容信息

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/_new"
function floating_ui:element/control/_new

#
tag @s add floating_ui_panel

#region 属性设置

#设置高度和宽度
execute unless data storage floating_ui:input temp.size run function floating_ui:element/panel/util/auto_size

#遍历子元素
execute if data storage floating_ui:input temp.child run data modify storage floating_ui:temp child append from storage floating_ui:input temp.child
data modify storage floating_ui:temp cache append from storage floating_ui:input temp
scoreboard players set @s floating_ui.child_z 10
data modify entity @s item.tag.data.childPoint set value []
execute if data storage floating_ui:input temp.child run function floating_ui:element/panel/add_child
data modify storage floating_ui:input temp set from storage floating_ui:temp cache[-1]
data remove storage floating_ui:temp cache[-1]
execute if data storage floating_ui:input temp.child run data remove storage floating_ui:temp child[-1]

#endregion
data remove storage floating_ui:debug curr[0]