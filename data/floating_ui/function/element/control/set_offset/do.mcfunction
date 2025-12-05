execute store result score x floating_ui.temp run data get storage floating_ui:input temp.x 10000
execute store result score y floating_ui.temp run data get storage floating_ui:input temp.y 10000
execute store result score z floating_ui.temp run data get storage floating_ui:input temp.z 10000

execute store result score @s floating_ui.root_x on vehicle run scoreboard players get @s floating_ui.root_x
execute store result score @s floating_ui.root_y on vehicle run scoreboard players get @s floating_ui.root_y
execute store result score @s floating_ui.root_z on vehicle run scoreboard players get @s floating_ui.root_z

scoreboard players operation @s floating_ui.parent_x = x floating_ui.temp
scoreboard players operation @s floating_ui.parent_y = y floating_ui.temp
scoreboard players operation @s floating_ui.parent_z = z floating_ui.temp

scoreboard players operation @s floating_ui.root_x += x floating_ui.temp
scoreboard players operation @s floating_ui.root_y += y floating_ui.temp
scoreboard players operation @s floating_ui.root_z += z floating_ui.temp

data modify entity @s item.components.minecraft:custom_data.data.x set from storage floating_ui:input temp.x
data modify entity @s item.components.minecraft:custom_data.data.y set from storage floating_ui:input temp.y
data modify entity @s item.components.minecraft:custom_data.data.z set from storage floating_ui:input temp.z

scoreboard players operation x floating_ui.temp *= 100 int
scoreboard players operation y floating_ui.temp *= 100 int
scoreboard players operation z floating_ui.temp *= 100 int

scoreboard players operation x floating_ui.temp /= @s floating_ui.scale
scoreboard players operation y floating_ui.temp /= @s floating_ui.scale
scoreboard players operation z floating_ui.temp /= @s floating_ui.scale

scoreboard players operation @s floating_ui.parent_x_without_scale = x floating_ui.temp
scoreboard players operation @s floating_ui.parent_y_without_scale = y floating_ui.temp
scoreboard players operation @s floating_ui.parent_z_without_scale = z floating_ui.temp

execute store result score @s floating_ui.root_x_without_scale on vehicle run scoreboard players get @s floating_ui.root_x_without_scale
execute store result score @s floating_ui.root_y_without_scale on vehicle run scoreboard players get @s floating_ui.root_y_without_scale
execute store result score @s floating_ui.root_z_without_scale on vehicle run scoreboard players get @s floating_ui.root_z_without_scale

scoreboard players operation @s floating_ui.root_x_without_scale += x floating_ui.temp
scoreboard players operation @s floating_ui.root_y_without_scale += y floating_ui.temp
scoreboard players operation @s floating_ui.root_z_without_scale += z floating_ui.temp

data modify storage floating_ui:temp transformation.translation set value [0f, 0f, 0f]
execute store result storage floating_ui:temp transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result storage floating_ui:temp transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y
execute store result storage floating_ui:temp transformation.translation[2] float 0.0001 run scoreboard players get @s floating_ui.root_z

execute store success score changed floating_ui.temp run data modify entity @s transformation.translation set from storage floating_ui:temp transformation.translation

function floating_ui:util/set_interpolation