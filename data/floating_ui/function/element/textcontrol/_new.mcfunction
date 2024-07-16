#> floating_ui:element/textcontrol/_new
# @within floating_ui:element/*/_new

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textcontrol/_new"

tag @s remove just

tag @s add floating_ui_textcontrol

data modify storage floating_ui:input summon.arg.type set value "text_display"
function floating_ui:macro/summon_with_rot with storage floating_ui:input summon.arg
data modify entity @n[tag=just,distance=..1] background set value 0
tag @n[tag=just,distance=..1] add floating_ui_textcontrol_text
ride @n[tag=just,distance=..1] mount @s

data modify entity @s item set value {id:"stone",count: 1b}
data modify entity @s transformation.scale[] set value 0f

#属性

#name
data modify storage floating_ui:input temp.this set from entity @s UUID
execute if data storage floating_ui:input temp.name as 1bf52-0-0-0-5 on origin run function floating_ui:element/control/append_name_list with storage floating_ui:input temp

#tag
execute if data storage floating_ui:input temp.tag run data modify entity @s Tags append from storage floating_ui:input temp.tag

#坐标
execute unless data storage floating_ui:input temp.x run data modify storage floating_ui:input temp.x set value 0
execute unless data storage floating_ui:input temp.y run data modify storage floating_ui:input temp.y set value 0
execute unless data storage floating_ui:input temp.z run data modify storage floating_ui:input temp.z set value 0
execute store result score x _ run data get storage floating_ui:input temp.x 10000
execute store result score y _ run data get storage floating_ui:input temp.y 10000
execute store result score z _ run data get storage floating_ui:input temp.z 10000
execute store result score @s floating_ui.parent_x as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.child_x
execute store result score @s floating_ui.parent_y as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.child_y
execute store result score @s floating_ui.parent_z as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.child_z
execute store result score @s floating_ui.root_x as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.root_x
execute store result score @s floating_ui.root_y as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.root_y
execute store result score @s floating_ui.root_z as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.root_z
scoreboard players operation @s floating_ui.root_x += @s floating_ui.parent_x
scoreboard players operation @s floating_ui.root_y += @s floating_ui.parent_y
scoreboard players operation @s floating_ui.root_z += @s floating_ui.parent_z
scoreboard players operation @s floating_ui.root_x += x _
scoreboard players operation @s floating_ui.root_y += y _
scoreboard players operation @s floating_ui.root_z += z _
execute store result entity @n[tag=just,distance=..1] transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result entity @n[tag=just,distance=..1] transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y
execute store result entity @n[tag=just,distance=..1] transformation.translation[2] float 0.0001 run scoreboard players get @s floating_ui.root_z
data modify entity @s item.components.minecraft:custom_data.x set from storage floating_ui:input temp.x
data modify entity @s item.components.minecraft:custom_data.y set from storage floating_ui:input temp.y
data modify entity @s item.components.minecraft:custom_data.z set from storage floating_ui:input temp.z

#字体大小
execute if data storage floating_ui:input temp.fontsize run data modify entity @s item.components.minecraft:custom_data.data.fontsize set from storage floating_ui:input temp.fontsize
execute unless data storage floating_ui:input temp.fontsize run data modify entity @s item.components.minecraft:custom_data.data.fontsize set value 2.0f
data modify entity @n[tag=just,distance=..1] transformation.scale[0] set from entity @s item.components.minecraft:custom_data.data.fontsize
data modify entity @n[tag=just,distance=..1] transformation.scale[1] set from entity @s item.components.minecraft:custom_data.data.fontsize

#旋转
execute if data storage floating_ui:input temp.rotation run data modify entity @s item.components.minecraft:custom_data.rotation set from storage floating_ui:input temp.rotation
execute if data storage floating_ui:input temp.rotation run data modify entity @n[tag=just,distance=..1] transformation.right_rotation set from entity @s item.components.minecraft:custom_data.rotation

#事件
execute if data storage floating_ui:input temp.move_in run data modify entity @s item.components.minecraft:custom_data.data.move_in set from storage floating_ui:input temp.move_in
execute if data storage floating_ui:input temp.move_out run data modify entity @s item.components.minecraft:custom_data.data.move_out set from storage floating_ui:input temp.move_out
execute if data storage floating_ui:input temp.move run data modify entity @s item.components.minecraft:custom_data.data.move set from storage floating_ui:input temp.move
execute if data storage floating_ui:input temp.right_click run data modify entity @s item.components.minecraft:custom_data.data.right_click set from storage floating_ui:input temp.right_click
execute if data storage floating_ui:input temp.left_click run data modify entity @s item.components.minecraft:custom_data.data.left_click set from storage floating_ui:input temp.left_click

#加入ui布局数据
data modify entity @s item.components.minecraft:custom_data.data.ui set from storage floating_ui:input temp

tag @s add new
#编号分配
execute as 1bf52-0-0-0-2 on origin run scoreboard players operation @n[distance=..1, tag=new] floating_ui.uid = @s floating_ui.uid
scoreboard players operation @s floating_ui.uid = @p[tag=floating_ui_owner] floating_ui.uid
#加入父节点
execute as 1bf52-0-0-0-2 on origin run ride @n[tag=new, distance=..1] mount @s

execute as 1bf52-0-0-0-2 on origin if entity @s[tag=floating_ui_root] run data modify entity @s item.components.minecraft:custom_data.size set from entity @n[tag=just,distance=..1] transformation.scale

#父节点替换
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID
#根节点
execute as 1bf52-0-0-0-5 on origin run data modify entity @n[tag=new,distance=..1] item.components.minecraft:custom_data.data.root set from entity @s UUID

#坐标记录
function floating_ui:element/textcontrol/gemo_data_flush
tag @s remove new

tag @e[tag=just, distance=..1] remove just

data remove storage floating_ui:debug curr[0]