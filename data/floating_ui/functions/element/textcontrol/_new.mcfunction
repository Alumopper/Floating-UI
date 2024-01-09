#> floating_ui:element/textcontrol/_new
# @within floating_ui:element/*/_new

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textcontrol/_new"

tag @s remove just

tag @s add floating_ui_textcontrol

data modify storage floating_ui:input summon.arg.type set value "text_display"
function floating_ui:macro/summon_with_rot with storage floating_ui:input summon.arg
data modify entity @e[tag=just,limit=1] background set value 0
tag @e[tag=just,limit=1] add floating_ui_textcontrol_text

data modify entity 0-0-0-0-4 Thrower set from entity @e[tag=just,limit=1] UUID
data modify entity @s data.displayEntity set from entity @e[tag=just,limit=1] UUID

#属性

#name
data modify entity @s data.name set from storage floating_ui:input temp.name

#坐标
execute unless data storage floating_ui:input temp.x run data modify storage floating_ui:input temp.x set value 0
execute unless data storage floating_ui:input temp.y run data modify storage floating_ui:input temp.y set value 0
execute unless data storage floating_ui:input temp.z run data modify storage floating_ui:input temp.z set value 0
execute store result score x _ run data get storage floating_ui:input temp.x 10000
execute store result score y _ run data get storage floating_ui:input temp.y 10000
execute store result score z _ run data get storage floating_ui:input temp.z 10000
execute store result score @s floating_ui.parent_x as 0-0-0-0-2 on origin run scoreboard players get @s floating_ui.child_x
execute store result score @s floating_ui.parent_y as 0-0-0-0-2 on origin run scoreboard players get @s floating_ui.child_y
execute store result score @s floating_ui.parent_z as 0-0-0-0-2 on origin run scoreboard players get @s floating_ui.child_z
execute store result score @s floating_ui.root_x as 0-0-0-0-2 on origin run scoreboard players get @s floating_ui.root_x
execute store result score @s floating_ui.root_y as 0-0-0-0-2 on origin run scoreboard players get @s floating_ui.root_y
execute store result score @s floating_ui.root_z as 0-0-0-0-2 on origin run scoreboard players get @s floating_ui.root_z
scoreboard players operation @s floating_ui.root_x += @s floating_ui.parent_x
scoreboard players operation @s floating_ui.root_y += @s floating_ui.parent_y
scoreboard players operation @s floating_ui.root_z += @s floating_ui.parent_z
scoreboard players operation @s floating_ui.root_x += x _
scoreboard players operation @s floating_ui.root_y += y _
scoreboard players operation @s floating_ui.root_z += z _
execute store result entity @e[tag=just,limit=1,sort=nearest] transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result entity @e[tag=just,limit=1,sort=nearest] transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y
execute store result entity @e[tag=just,limit=1,sort=nearest] transformation.translation[2] float 0.0001 run scoreboard players get @s floating_ui.root_z
data modify entity @s data.x set from storage floating_ui:input temp.x
data modify entity @s data.y set from storage floating_ui:input temp.y
data modify entity @s data.z set from storage floating_ui:input temp.z

#字体大小
execute if data storage floating_ui:input temp.fontsize run data modify entity @s data.fontsize set from storage floating_ui:input temp.fontsize
execute unless data storage floating_ui:input temp.fontsize run data modify entity @s data.fontsize set value 2.0f
data modify entity @e[tag=just,limit=1] transformation.scale[0] set from entity @s data.fontsize
data modify entity @e[tag=just,limit=1] transformation.scale[1] set from entity @s data.fontsize

#事件
execute if data storage floating_ui:input temp.move_in run data modify entity @s data.move_in set from storage floating_ui:input temp.move_in
execute if data storage floating_ui:input temp.move_out run data modify entity @s data.move_out set from storage floating_ui:input temp.move_out
execute if data storage floating_ui:input temp.move run data modify entity @s data.move set from storage floating_ui:input temp.move
execute if data storage floating_ui:input temp.right_click run data modify entity @s data.right_click set from storage floating_ui:input temp.right_click
execute if data storage floating_ui:input temp.left_click run data modify entity @s data.left_click set from storage floating_ui:input temp.left_click

#加入ui布局数据
data modify entity @s data.ui set from storage floating_ui:input temp

tag @s add new
#编号分配
execute at @s as 0-0-0-0-2 on origin run scoreboard players operation @e[distance=0,tag=new] floating_ui.uid = @s floating_ui.uid
scoreboard players operation @s floating_ui.uid = @p[tag=floating_ui_owner] uid
#加入父节点
execute at @s as 0-0-0-0-2 on origin if entity @s[type=marker] run data modify entity @s data.childPoint prepend from entity @e[tag=new,limit=1] UUID
execute at @s as 0-0-0-0-2 on origin if entity @s[type=item_display] run data modify entity @s item.tag.data.childPoint prepend from entity @e[tag=new,limit=1] UUID

execute at @s as 0-0-0-0-2 on origin if entity @s[tag=floating_ui_root] run data modify entity @s data.size set from entity @e[tag=just,limit=1] transformation.scale

data modify entity @s data.parent set from entity 0-0-0-0-2 Thrower
#父节点替换
data modify entity 0-0-0-0-2 Thrower set from entity @s UUID
#坐标记录
function floating_ui:element/control/gemo_data_flush
tag @s remove new

tag @e[tag=just] remove just

data remove storage floating_ui:debug curr[0]