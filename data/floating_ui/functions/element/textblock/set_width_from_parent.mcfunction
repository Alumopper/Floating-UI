#> floating_ui:element/textblock/set_width_from_parent
# @internal

execute store result score width _ on vehicle run data get entity @s item.tag.data.size[0] 100
execute store result entity @s line_width int 0.0001 run scoreboard players operation width _ *= 2083 int