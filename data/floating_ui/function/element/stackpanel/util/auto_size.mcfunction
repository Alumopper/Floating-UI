#> floating_ui:element/list/util/auto_size
# @internal

tag @s add floating_ui_this
execute on vehicle if entity @s[tag=floating_ui_root] run return run function floating_ui:element/list/util/auto_size_root

#计算控件大小
execute on vehicle store result score width floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.size[0] 0.5
execute on vehicle store result score height floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.size[1] 0.5

scoreboard players operation left floating_ui.temp = width floating_ui.temp
scoreboard players operation right floating_ui.temp = width floating_ui.temp
scoreboard players operation top floating_ui.temp = height floating_ui.temp
scoreboard players operation bottom floating_ui.temp = height floating_ui.temp
scoreboard players operation left floating_ui.temp += @s floating_ui.parent_x 
scoreboard players operation right floating_ui.temp -= @s floating_ui.parent_x
scoreboard players operation top floating_ui.temp -= @s floating_ui.parent_y
scoreboard players operation bottom floating_ui.temp += @s floating_ui.parent_y
#取最小值
execute if score right floating_ui.temp < left floating_ui.temp run scoreboard players operation left floating_ui.temp = right floating_ui.temp
execute if score bottom floating_ui.temp < top floating_ui.temp run scoreboard players operation top floating_ui.temp = bottom floating_ui.temp
#调整大小
execute store result entity @s transformation.scale[0] float 2.0 run scoreboard players get left floating_ui.temp
execute store result entity @s item.components.minecraft:custom_data.data.size[0] float 2.0 run scoreboard players get left floating_ui.temp
execute store result entity @s transformation.scale[1] float 2.0 run scoreboard players get top floating_ui.temp
execute store result entity @s item.components.minecraft:custom_data.data.size[1] float 2.0 run scoreboard players get top floating_ui.temp
