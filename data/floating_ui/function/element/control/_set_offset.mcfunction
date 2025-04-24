#> floating_ui:element/control/_set_offset
# 设置这个控件的偏移
# @api
# @input floating_ui:input temp [float x,float y, float z]

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
execute store result score @s floating_ui.root_x_without_scale run scoreboard players operation @s floating_ui.root_x += x _
execute store result score @s floating_ui.root_y_without_scale run scoreboard players operation @s floating_ui.root_y += y _
execute store result score @s floating_ui.root_z_without_scale run scoreboard players operation @s floating_ui.root_z += z _
execute store result entity @s transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result entity @s transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y
execute store result entity @s transformation.translation[2] float 0.0001 run scoreboard players get @s floating_ui.root_z
data modify entity @s item.components.minecraft:custom_data.data.x set from storage floating_ui:input temp.x
data modify entity @s item.components.minecraft:custom_data.data.y set from storage floating_ui:input temp.y
data modify entity @s item.components.minecraft:custom_data.data.z set from storage floating_ui:input temp.z