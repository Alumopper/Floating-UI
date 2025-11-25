
# size[1] = ((20 * line) + 2)*fontsize/80
scoreboard players operation line floating_ui.temp *= 20 int
scoreboard players operation line floating_ui.temp += 2 int
execute store result score fontSize floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.fontsize 10000
scoreboard players operation line floating_ui.temp *= fontSize floating_ui.temp
scoreboard players operation line floating_ui.temp /= 80 int
execute store result entity @s item.components.minecraft:custom_data.data.size[1] float 0.0001 run scoreboard players get line floating_ui.temp
