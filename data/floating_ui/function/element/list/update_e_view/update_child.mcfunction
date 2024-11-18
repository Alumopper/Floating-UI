execute if score @s floating_ui.list.childCount matches ..0 run return 1

scoreboard players operation content_height _ -= @s floating_ui.size1

# 更新子元素位置
scoreboard players add count _ 1
scoreboard players operation offet _ = @s floating_ui.size1
scoreboard players operation offet _ /= 2 int
scoreboard players operation offet _ += content_height _
scoreboard players operation @s floating_ui.parent_y = offet _
execute store result score @s floating_ui.root_y on vehicle run scoreboard players get @s floating_ui.root_y
execute store result score y _ run data get entity @s item.components.minecraft:custom_data.data.y 10000
scoreboard players operation @s floating_ui.root_y += y _
scoreboard players operation @s floating_ui.root_y += @s floating_ui.parent_y
