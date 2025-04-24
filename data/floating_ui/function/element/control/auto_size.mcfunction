#> floating_ui:element/control/util/auto_size
# @internal
# 由这个控件的父控件作为执行者调用此函数

execute unless data storage floating_ui:input temp.x run data modify storage floating_ui:input temp.x set value 0
execute unless data storage floating_ui:input temp.y run data modify storage floating_ui:input temp.y set value 0

execute if entity @s[tag=floating_ui_root] run return run data modify storage floating_ui:input temp.size set value [5.0f,5.0f]

#计算控件大小
execute store result score width _ run data get entity @s item.components.minecraft:custom_data.data.size[0] 0.5
execute store result score height _ run data get entity @s item.components.minecraft:custom_data.data.size[1] 0.5

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
execute store result storage floating_ui:input temp.size[0] float 2.0 run scoreboard players get left _
execute store result storage floating_ui:input temp.size[1] float 2.0 run scoreboard players get top _
