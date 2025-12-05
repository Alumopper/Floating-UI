#> floating_ui:element/control/_move
# 将这个控件及其子控件移动相应的距离
# @api
# @input floating_ui:input move [float x,float y]

execute store result score move.x floating_ui.temp run data get storage floating_ui:input move.x 10000.0
execute store result score move.y floating_ui.temp run data get storage floating_ui:input move.y 10000.0
execute store result score move.z floating_ui.temp run data get storage floating_ui:input move.z 10000.0

scoreboard players operation @s floating_ui.root_x += move.x floating_ui.temp
scoreboard players operation @s floating_ui.root_y += move.y floating_ui.temp
scoreboard players operation @s floating_ui.root_z += move.z floating_ui.temp

scoreboard players operation @s floating_ui.parent_x += move.x floating_ui.temp
scoreboard players operation @s floating_ui.parent_y += move.y floating_ui.temp
scoreboard players operation @s floating_ui.parent_z += move.z floating_ui.temp

scoreboard players operation move.x floating_ui.temp *= 100 int
scoreboard players operation move.y floating_ui.temp *= 100 int
scoreboard players operation move.z floating_ui.temp *= 100 int

scoreboard players operation move.x floating_ui.temp /= @s floating_ui.scale
scoreboard players operation move.y floating_ui.temp /= @s floating_ui.scale
scoreboard players operation move.z floating_ui.temp /= @s floating_ui.scale

scoreboard players operation @s floating_ui.root_x_without_scale += move.x floating_ui.temp
scoreboard players operation @s floating_ui.root_y_without_scale += move.y floating_ui.temp
scoreboard players operation @s floating_ui.root_z_without_scale += move.z floating_ui.temp

scoreboard players operation @s floating_ui.parent_x_without_scale += move.x floating_ui.temp
scoreboard players operation @s floating_ui.parent_y_without_scale += move.y floating_ui.temp
scoreboard players operation @s floating_ui.parent_z_without_scale += move.z floating_ui.temp


data modify storage floating_ui:temp transformation.translation set value [0f, 0f, 0f]
execute store result storage floating_ui:temp transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result storage floating_ui:temp transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y
execute store result storage floating_ui:temp transformation.translation[2] float 0.0001 run scoreboard players get @s floating_ui.root_z

execute store success score changed floating_ui.temp run data modify entity @s transformation.translation set from storage floating_ui:temp transformation.translation

function floating_ui:util/set_interpolation