#> floating_ui:element/textblock/set_width_from_parent
# @internal

execute as 1bf52-0-0-0-2 on origin run data modify entity 1bf52-0-0-0-4 Thrower set from entity @s data.parent
execute store result score width _ as 1bf52-0-0-0-4 on origin run data get entity @s item.tag.data.size[0] 100
execute store result entity @s line_width int 0.0001 run scoreboard players operation width _ *= 2083 int