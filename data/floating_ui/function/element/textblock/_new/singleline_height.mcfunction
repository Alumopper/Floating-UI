# 对单行可以简化为 size[1] = fontsize * 0.275
execute store result score fontSize floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.fontsize 2750
execute store result entity @s item.components.minecraft:custom_data.data.size[1] float 0.0001 run scoreboard players get fontSize floating_ui.temp
