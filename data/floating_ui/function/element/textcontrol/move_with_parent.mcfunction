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

scoreboard players operation x floating_ui.temp = @s floating_ui.root_x
scoreboard players operation y floating_ui.temp = @s floating_ui.root_y
scoreboard players operation z floating_ui.temp = @s floating_ui.root_z

scoreboard players operation text_y floating_ui.temp = @s floating_ui.size1
scoreboard players operation text_y floating_ui.temp /= 2 int
scoreboard players operation y floating_ui.temp -= text_y floating_ui.temp

data modify storage floating_ui:temp transformation.translation set value [0f, 0f, 0f]
execute store result storage floating_ui:temp transformation.translation[0] float 0.0001 run scoreboard players get x floating_ui.temp
execute store result storage floating_ui:temp transformation.translation[1] float 0.0001 run scoreboard players get y floating_ui.temp
execute store result storage floating_ui:temp transformation.translation[2] float 0.0001 run scoreboard players get z floating_ui.temp

scoreboard players set changed floating_ui.temp 0
execute on passengers store success score changed floating_ui.temp run data modify entity @s transformation.translation set from storage floating_ui:temp transformation.translation

execute on passengers run function floating_ui:util/set_interpolation