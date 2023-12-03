#> floating_ui:element/control/_new
# @within floating_ui:element/*/_new

data modify storage floating_ui:debug curr prepend value "floating_ui:element/control/_new"
tp @s ~ ~ ~ ~ ~

tag @s add floating_ui_control

#显示物品
execute unless data storage floating_ui:input temp.item.id run data modify storage floating_ui:input temp.item.id set value "minecraft:glass_pane"
data modify storage floating_ui:input temp.item.Count set value 1b
data modify entity @s item set from storage floating_ui:input temp.item
data modify entity @s item.tag.CustomModelData set from storage floating_ui:input temp.item.tex

#属性
#坐标
execute unless data storage floating_ui:input temp.x run data modify storage floating_ui:input temp.x set value 0
execute unless data storage floating_ui:input temp.y run data modify storage floating_ui:input temp.y set value 0
function floating_ui:element/control/set_pos with storage floating_ui:input temp
data modify entity @s item.tag.data.x set from storage floating_ui:input temp.x
data modify entity @s item.tag.data.y set from storage floating_ui:input temp.y

#大小
execute if data storage floating_ui:input temp.size run data modify entity @s transformation.scale[0] set from storage floating_ui:input temp.size[0]
execute if data storage floating_ui:input temp.size run data modify entity @s transformation.scale[1] set from storage floating_ui:input temp.size[1]
data modify entity @s item.tag.data.size set from storage floating_ui:input temp.size

#事件
execute if data storage floating_ui:input temp.move_in run data modify entity @s item.tag.data.move_in set from storage floating_ui:input temp.move_in
execute if data storage floating_ui:input temp.move_out run data modify entity @s item.tag.data.move_out set from storage floating_ui:input temp.move_out
execute if data storage floating_ui:input temp.move run data modify entity @s item.tag.data.move set from storage floating_ui:input temp.move
execute if data storage floating_ui:input temp.right_click run data modify entity @s item.tag.data.right_click set from storage floating_ui:input temp.right_click
execute if data storage floating_ui:input temp.left_click run data modify entity @s item.tag.data.left_click set from storage floating_ui:input temp.left_click

#加入ui布局数据
data modify entity @s item.tag.data.ui set from storage floating_ui:input temp

tag @s add new
#编号分配
execute at @s as 0-0-0-0-2 on origin run scoreboard players operation @e[distance=0,tag=new] floating_ui.uid = @s floating_ui.uid
scoreboard players operation @s floating_ui.uid = @p[tag=floating_ui_owner] uid
#加入父节点
execute at @s as 0-0-0-0-2 on origin if entity @s[type=marker] run data modify entity @s data.childPoint append from entity @e[tag=new,limit=1] UUID
execute at @s as 0-0-0-0-2 on origin if entity @s[type=marker] run data modify entity @s data.size set from entity @e[tag=new,limit=1] transformation.scale
execute at @s as 0-0-0-0-2 on origin if entity @s[type=item_display] run data modify entity @s item.tag.data.childPoint append from entity @e[tag=new,limit=1] UUID
data modify entity @s item.tag.data.parent set from entity 0-0-0-0-2 Thrower
#父节点替换
data modify entity 0-0-0-0-2 Thrower set from entity @s UUID
#坐标记录
function floating_ui:element/control/gemo_data_flush
tag @s remove new

data remove storage floating_ui:debug curr[0]