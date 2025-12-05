#> floating_ui:element/control/_new
# @within floating_ui:element/*/_new

execute if data storage floating_ui:input temp.before_init run function floating_ui:macro/before_init_event with storage floating_ui:input temp

#编号分配
execute at @s as 1bf52-0-0-0-2 on origin run scoreboard players operation @n[distance=..1, tag=just] floating_ui.uid = @s floating_ui.uid
#加入父节点
execute as 1bf52-0-0-0-2 on origin run ride @n[tag=just, distance=..1] mount @s

tag @s remove just

tag @s add floating_ui_control

# 显示物品
execute unless data storage floating_ui:input temp.item.id run data modify storage floating_ui:input temp.item.id set value "minecraft:glass_pane"
execute unless data storage floating_ui:input temp.item.count run data modify storage floating_ui:input temp.item.count set value 1b
data modify entity @s item set from storage floating_ui:input temp.item

# 材质
data modify entity @s item.components."minecraft:item_model" set from storage floating_ui:input temp.model

# 亮度
data modify entity @s brightness set value {block: 15, sky: 15}

#属性

#name
data modify storage floating_ui:input temp.this set from entity @s UUID
execute if data storage floating_ui:input temp.name as 1bf52-0-0-0-5 on origin run function floating_ui:element/control/append_name_list with storage floating_ui:input temp
execute if data storage floating_ui:input temp.name run data modify entity @s item.components."minecraft:custom_data".data.name set from storage floating_ui:input temp.name

#tag
execute if data storage floating_ui:input temp.tag run data modify entity @s Tags append from storage floating_ui:input temp.tag

# 是否启用
execute store success score @s floating_ui.enabled if data storage floating_ui:input temp{enabled: true}

#默认缩放大小都是1
scoreboard players set @s floating_ui.scale 100

#region 坐标
execute unless data storage floating_ui:input temp.x run data modify storage floating_ui:input temp.x set value 0
execute unless data storage floating_ui:input temp.y run data modify storage floating_ui:input temp.y set value 0
execute unless data storage floating_ui:input temp.z run data modify storage floating_ui:input temp.z set value 0
function floating_ui:element/control/_set_offset
#endregion

#大小。如果没有动画，插入默认动画，否则执行动画
data modify entity @s transformation.scale[2] set value 0.0f
execute if score noNewAnim floating_ui.temp matches 0 run function floating_ui:element/control/_new/new_anim
execute if score noNewAnim floating_ui.temp matches 1 run data modify entity @s transformation.scale[0] set from storage floating_ui:input temp.size[0]
execute if score noNewAnim floating_ui.temp matches 1 run data modify entity @s transformation.scale[1] set from storage floating_ui:input temp.size[1]
data modify entity @s item.components.minecraft:custom_data.data.size set from storage floating_ui:input temp.size

#旋转
execute if data storage floating_ui:input temp.rotation run data modify entity @s transformation.left_rotation set from storage floating_ui:input temp.rotation
execute unless data storage floating_ui:input temp.rotation run data modify entity @s transformation.left_rotation set value [0.0f,1.0f,0.0f,0.0f]

#渲染模式
execute if data storage floating_ui:input temp.display run data modify entity @s item_display set from storage floating_ui:input temp.display

#region 事件
execute if data storage floating_ui:input temp.move_in run data modify entity @s item.components.minecraft:custom_data.data.move_in set from storage floating_ui:input temp.move_in
execute if data storage floating_ui:input temp.move_out run data modify entity @s item.components.minecraft:custom_data.data.move_out set from storage floating_ui:input temp.move_out
execute if data storage floating_ui:input temp.move run data modify entity @s item.components.minecraft:custom_data.data.move set from storage floating_ui:input temp.move
execute if data storage floating_ui:input temp.right_click run data modify entity @s item.components.minecraft:custom_data.data.right_click set from storage floating_ui:input temp.right_click
execute if data storage floating_ui:input temp.left_click run data modify entity @s item.components.minecraft:custom_data.data.left_click set from storage floating_ui:input temp.left_click
execute if data storage floating_ui:input temp.roll run data modify entity @s item.components.minecraft:custom_data.data.roll set from storage floating_ui:input temp.roll
execute if data storage floating_ui:input temp.init run data modify entity @s item.components.minecraft:custom_data.data.init set from storage floating_ui:input temp.init

#endregion

#custom_data
execute if data storage floating_ui:input temp.custom_data run data modify entity @s item.components."minecraft:custom_data".data.custom_data set from storage floating_ui:input temp.custom_data

#加入ui布局数据
data modify entity @s item.components.minecraft:custom_data.data.ui set from storage floating_ui:input temp

#可视距离
data modify entity @s item.components.minecraft:custom_data.data.view_range set from entity @s view_range

tag @s add new
#父节点替换
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID
#根节点
execute as 1bf52-0-0-0-5 on origin run data modify entity @n[tag=new, distance=..1] item.components.minecraft:custom_data.data.root set from entity @s UUID

#坐标记录
function floating_ui:element/control/gemo_data_flush
tag @s remove new

#可见
scoreboard players set @s floating_ui.visible 1

#高度和宽度
execute store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000