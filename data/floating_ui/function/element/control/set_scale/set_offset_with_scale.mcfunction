#在父控件设置缩放的时候，通过父控件调用此方法，设置子空间和父控件的相对坐标

execute store result score x _ run data get entity @s item.components.minecraft:custom_data.data.x 10000
execute store result score y _ run data get entity @s item.components.minecraft:custom_data.data.y 10000
execute store result score z _ run data get entity @s item.components.minecraft:custom_data.data.z 10000
execute store result score @s floating_ui.parent_x as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.child_x
execute store result score @s floating_ui.parent_y as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.child_y
execute store result score @s floating_ui.parent_z as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.child_z
scoreboard players operation x _ += @s floating_ui.parent_x
scoreboard players operation y _ += @s floating_ui.parent_y
scoreboard players operation z _ += @s floating_ui.parent_z
scoreboard players operation x _ *= scale _
scoreboard players operation y _ *= scale _
scoreboard players operation z _ *= scale _
execute store result score @s floating_ui.root_x as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.root_x
execute store result score @s floating_ui.root_y as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.root_y
execute store result score @s floating_ui.root_z as 1bf52-0-0-0-2 on origin run scoreboard players get @s floating_ui.root_z
scoreboard players operation @s floating_ui.root_x *= 100 int
scoreboard players operation @s floating_ui.root_y *= 100 int
scoreboard players operation @s floating_ui.root_z *= 100 int 
scoreboard players operation @s floating_ui.root_x += x _
scoreboard players operation @s floating_ui.root_y += y _
scoreboard players operation @s floating_ui.root_z += z _
execute store result entity @s transformation.translation[0] float 0.000001 run scoreboard players get @s floating_ui.root_x
execute store result entity @s transformation.translation[1] float 0.000001 run scoreboard players get @s floating_ui.root_y
execute store result entity @s transformation.translation[2] float 0.000001 run scoreboard players get @s floating_ui.root_z
scoreboard players operation @s floating_ui.root_x /= 100 int
scoreboard players operation @s floating_ui.root_y /= 100 int
scoreboard players operation @s floating_ui.root_z /= 100 int