#> floating_ui:element/control/_new
# @within floating_ui:element/*/_new

data modify storage floating_ui:debbvbvbvbvbvbvug curr prepend value "floating_ui:element/control/_new"

tag @s remove just

tag @s add floating_ui_control

#显示物品
execute unless data storage floating_ui:input temp.item.id run data modify storage floating_ui:input temp.item.id set value "minecraft:glass_pane"
data modify storage floating_ui:input temp.item.Count set value 1b
data modify entity @s item set from storage floating_ui:input temp.item
data modify entity @s item.tag.CustomModelData set from storage floating_ui:input temp.item.tex

#属性

#name
data modify storage floating_ui:input temp.this set from entity @s UUID
execute if data storage floating_ui:input temp.name as 1bf52-0-0-0-5 on origin run function floating_ui:element/control/append_name_list with storage floating_ui:input temp

#tag
execute if data storage floating_ui:input temp.tag run data modify entity @s Tags append from storage floating_ui:input temp.tag

#region 坐标
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
execute store result entity @s transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result entity @s transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y
execute store result entity @s transformation.translation[2] float 0.0001 run scoreboard players get @s floating_ui.root_z
data modify entity @s item.tag.data.x set from storage floating_ui:input temp.x
data modify entity @s item.tag.data.y set from storage floating_ui:input temp.y
data modify entity @s item.tag.data.z set from storage floating_ui:input temp.z
#endregion

#大小。如果没有动画，插入默认动画，否则执行动画
data modify entity @s transformation.scale[2] set value 0.0f
execute store success score hasNewAnim _ run data get storage floating_ui:input temp.anim.new
execute if score hasNewAnim _ matches 1 run data modify entity @s transformation.scale[0] set from storage floating_ui:input temp.size[0]
execute if score hasNewAnim _ matches 1 run data modify entity @s transformation.scale[1] set from storage floating_ui:input temp.size[1]
execute unless score hasNewAnim _ matches 1 run data modify entity @s transformation.scale set value [0.0f,0.0f,0.0f]
execute unless score hasNewAnim _ matches 1 run data modify storage floating_ui:input temp.anim.new set value {value:[{key:"transformation.scale[0]",value:0f},{key:"transformation.scale[1]",value:0f}],time:3}
execute unless score hasNewAnim _ matches 1 run data modify storage floating_ui:input temp.anim.new.value[0].value set from storage floating_ui:input temp.size[0]
execute unless score hasNewAnim _ matches 1 run data modify storage floating_ui:input temp.anim.new.value[1].value set from storage floating_ui:input temp.size[1]
tag @s add floating_ui_schedule_animation
data modify entity @s item.tag.data.size set from storage floating_ui:input temp.size

#旋转
execute if data storage floating_ui:input temp.rotation run data modify entity @s transformation.rotation set from storage floating_ui:input temp.rotation
execute unless data storage floating_ui:input temp.rotation run data modify entity @s transformation.rotation set value [0.0f,1.0f,0.0f,0.0f]

#渲染模式
execute if data storage floating_ui:input temp.display run data modify entity @s item_display set from storage floating_ui:input temp.display

#region 事件

execute if data storage floating_ui:input temp.move_in run data modify entity @s item.tag.data.move_in set from storage floating_ui:input temp.move_in
execute if data storage floating_ui:input temp.move_out run data modify entity @s item.tag.data.move_out set from storage floating_ui:input temp.move_out
execute if data storage floating_ui:input temp.move run data modify entity @s item.tag.data.move set from storage floating_ui:input temp.move
execute if data storage floating_ui:input temp.right_click run data modify entity @s item.tag.data.right_click set from storage floating_ui:input temp.right_click
execute if data storage floating_ui:input temp.left_click run data modify entity @s item.tag.data.left_click set from storage floating_ui:input temp.left_click

#data modify storage floating_ui:temp arg.event set value "move_in"
#data modify storage floating_ui:temp arg.function set from storage floating_ui:input temp.move_in
#execute if data storage floating_ui:input temp.move_in run function floating_ui:element/control/util/event_append.#function with storage floating_ui:temp arg
#
#data modify storage floating_ui:temp arg.event set value "move_out"
#data modify storage floating_ui:temp arg.function set from storage floating_ui:input temp.move_out
#execute if data storage floating_ui:input temp.move_out run function floating_ui:element/control/util/event_append.#function with storage floating_ui:temp arg
#
#data modify storage floating_ui:temp arg.event set value "move"
#data modify storage floating_ui:temp arg.function set from storage floating_ui:input temp.move
#execute if data storage floating_ui:input temp.move run function floating_ui:element/control/util/event_append.#function with storage floating_ui:temp arg
#
#data modify storage floating_ui:temp arg.event set value "right_click"
#data modify storage floating_ui:temp arg.function set from storage floating_ui:input temp.right_click
#execute if data storage floating_ui:input temp.right_click run function floating_ui:element/control/util/event_append.#function with storage floating_ui:temp arg
#
#data modify storage floating_ui:temp arg.event set value "left_click"
#data modify storage floating_ui:temp arg.function set from storage floating_ui:input temp.left_click
#execute if data storage floating_ui:input temp.left_click run function floating_ui:element/control/util/event_append.#function with storage floating_ui:temp arg

#endregion

#加入ui布局数据
data modify entity @s item.tag.data.ui set from storage floating_ui:input temp

tag @s add new
#编号分配
execute at @s as 1bf52-0-0-0-2 on origin run scoreboard players operation @e[distance=0,tag=new] floating_ui.uid = @s floating_ui.uid
scoreboard players operation @s floating_ui.uid = @p[tag=floating_ui_owner] floating_ui.uid
#加入父节点
execute as 1bf52-0-0-0-2 on origin run ride @e[tag=new,limit=1] mount @s
#父节点替换
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID
#根节点
execute as 1bf52-0-0-0-5 on origin run data modify entity @e[tag=new,limit=1,distance=0] item.tag.data.root set from entity @s UUID

#坐标记录
function floating_ui:element/control/gemo_data_flush
tag @s remove new

data remove storage floating_ui:debug curr[0]