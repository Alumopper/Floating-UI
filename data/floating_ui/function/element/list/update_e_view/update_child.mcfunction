execute if score @s floating_ui.list.childCount matches ..0 run return 1

scoreboard players operation content_height floating_ui.temp -= @s floating_ui.size1

# 更新子元素位置
scoreboard players add count floating_ui.temp 1
scoreboard players operation offet floating_ui.temp = @s floating_ui.size1
scoreboard players operation offet floating_ui.temp /= 2 int
scoreboard players operation offet floating_ui.temp += content_height floating_ui.temp
scoreboard players operation @s floating_ui.parent_y = offet floating_ui.temp
execute store result score @s floating_ui.root_y on vehicle run scoreboard players get @s floating_ui.root_y
execute store result score y floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.y 10000
scoreboard players operation @s floating_ui.root_y += y floating_ui.temp
scoreboard players operation @s floating_ui.root_y += @s floating_ui.parent_y
execute store result entity @s transformation.translation[0] float 0.0001 run scoreboard players get @s floating_ui.root_x
execute store result entity @s transformation.translation[1] float 0.0001 run scoreboard players get @s floating_ui.root_y
