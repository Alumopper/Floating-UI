#> floating_ui:element/textcontrol/_move
# @api

execute store result score move.x _ run data get storage floating_ui:input move.x 10000.0
execute store result score move.y _ run data get storage floating_ui:input move.y 10000.0
scoreboard players operation @s floating_ui.root_x += move.x _
scoreboard players operation @s floating_ui.root_y += move.y _
scoreboard players operation @s floating_ui.parent_x += move.x _
scoreboard players operation @s floating_ui.parent_y += move.y _
execute store result entity @s transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result entity @s transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y