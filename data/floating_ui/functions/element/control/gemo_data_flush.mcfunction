#> floating_ui:element/control/gemo_data_flush
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/control/gemo_data_flush"
execute store result score @s floating_ui.x run data get entity @s Pos[0] 10000
execute store result score @s floating_ui.y run data get entity @s Pos[1] 10000
execute store result score @s floating_ui.z run data get entity @s Pos[2] 10000
execute store result score @s floating_ui.u run data get entity @s item.tag.x
execute store result score @s floating_ui.v run data get entity @s item.tag.y
execute rotated as @s positioned .0 .0 .0 run tp 0-0-0-0-0 ^ ^ ^1
execute store result score @s floating_ui.f0 run data get entity 0-0-0-0-0 Pos[0] 10000.0
execute store result score @s floating_ui.f1 run data get entity 0-0-0-0-0 Pos[1] 10000.0
execute store result score @s floating_ui.f2 run data get entity 0-0-0-0-0 Pos[2] 10000.0
tp 0-0-0-0-0 .0 .0 .0
data remove storage floating_ui:debug curr[0]