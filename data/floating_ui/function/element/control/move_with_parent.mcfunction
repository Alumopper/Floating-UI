execute store result score @s floating_ui.root_x on vehicle run scoreboard players get @s floating_ui.root_x
execute store result score @s floating_ui.root_y on vehicle run scoreboard players get @s floating_ui.root_y
execute store result score @s floating_ui.root_z on vehicle run scoreboard players get @s floating_ui.root_z

scoreboard players operation @s floating_ui.root_x += @s floating_ui.parent_x
scoreboard players operation @s floating_ui.root_y += @s floating_ui.parent_y
scoreboard players operation @s floating_ui.root_z += @s floating_ui.parent_z

execute store result score @s floating_ui.root_x_without_scale on vehicle run scoreboard players get @s floating_ui.root_x_without_scale
execute store result score @s floating_ui.root_y_without_scale on vehicle run scoreboard players get @s floating_ui.root_y_without_scale
execute store result score @s floating_ui.root_z_without_scale on vehicle run scoreboard players get @s floating_ui.root_z_without_scale

scoreboard players operation @s floating_ui.root_x_without_scale += @s floating_ui.parent_x_without_scale
scoreboard players operation @s floating_ui.root_y_without_scale += @s floating_ui.parent_y_without_scale
scoreboard players operation @s floating_ui.root_z_without_scale += @s floating_ui.parent_z_without_scale

data modify storage floating_ui:temp transformation.translation set value [0f, 0f, 0f]
execute store result storage floating_ui:temp transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result storage floating_ui:temp transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y
execute store result storage floating_ui:temp transformation.translation[2] float 0.0001 run scoreboard players get @s floating_ui.root_z

execute store success score changed floating_ui.temp run data modify entity @s transformation.translation set from storage floating_ui:temp transformation.translation

function floating_ui:util/set_interpolation

#移动子节点
execute on passengers run function floating_ui:element/control/move_to/text_or_control