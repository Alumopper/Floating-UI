#> floating_ui:element/control/_move
# 将这个控件及其子控件移动相应的距离
# @api
# @input floating_ui:input move [float x,float y]

execute store result score move.x floating_ui.temp run data get storage floating_ui:input move.x 10000.0
execute store result score move.y floating_ui.temp run data get storage floating_ui:input move.y 10000.0
scoreboard players operation @s floating_ui.root_x += move.x floating_ui.temp
scoreboard players operation @s floating_ui.root_y += move.y floating_ui.temp
scoreboard players operation @s floating_ui.parent_x += move.x floating_ui.temp
scoreboard players operation @s floating_ui.parent_y += move.y floating_ui.temp
execute store result entity @s interpolation_duration int 1 run scoreboard players get time floating_ui.temp
execute store result entity @s start_interpolation int 1 run scoreboard players get time floating_ui.temp
execute store result entity @s transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result entity @s transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y