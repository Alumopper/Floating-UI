#> floating_ui:element/textblock/set_width_from_parent
# @internal

execute store result score width _ on vehicle run data get entity @s item.components.minecraft:custom_data.data.ui.size[0] 200
execute store result entity @s line_width int 0.0001 run scoreboard players operation width _ *= 2083 int