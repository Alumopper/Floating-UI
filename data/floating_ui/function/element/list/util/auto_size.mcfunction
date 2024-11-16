#> floating_ui:element/list/util/auto_size
# @internal

tag @s add floating_ui_this
execute on vehicle if entity @s[tag=floating_ui_root] run return run function floating_ui:element/list/util/auto_size_root

#计算控件大小
execute on vehicle store result score width _ run data get entity @s item.components.minecraft:custom_data.data.size[0] 0.5
execute on vehicle store result score height _ run data get entity @s item.components.minecraft:custom_data.data.size[1] 0.5

scoreboard players operation left _ = width _
scoreboard players operation right _ = width _
scoreboard players operation top _ = height _
scoreboard players operation bottom _ = height _
scoreboard players operation left _ += @s floating_ui.parent_x 
scoreboard players operation right _ -= @s floating_ui.parent_x
scoreboard players operation top _ -= @s floating_ui.parent_y
scoreboard players operation bottom _ += @s floating_ui.parent_y
#取最小值
execute if score right _ < left _ run scoreboard players operation left _ = right _
execute if score bottom _ < top _ run scoreboard players operation top _ = bottom _
#调整大小
execute store result entity @s transformation.scale[0] float 2.0 run scoreboard players get left _
execute store result entity @s item.components.minecraft:custom_data.data.size[0] float 2.0 run scoreboard players get left _
execute store result entity @s transformation.scale[1] float 2.0 run scoreboard players get top _
execute store result entity @s item.components.minecraft:custom_data.data.size[1] float 2.0 run scoreboard players get top _
