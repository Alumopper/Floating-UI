#> floating_ui:element/control/gemo_data_flush
# @internal

#这里的return_uv是相对于根节点的uv

data modify storage floating_ui:debug curr prepend value "floating_ui:element/control/gemo_data_flush"
execute store result score @s floating_ui.x run data get entity @s Pos[0] 10000
execute store result score @s floating_ui.y run data get entity @s Pos[1] 10000
execute store result score @s floating_ui.z run data get entity @s Pos[2] 10000
scoreboard players operation @s floating_ui.x += @s floating_ui.root_x
scoreboard players operation @s floating_ui.y += @s floating_ui.root_y
scoreboard players operation @s floating_ui.z += @s floating_ui.root_z
execute rotated as @s positioned .0 .0 .0 run tp 1bf52-0-0-0-0 ^ ^ ^1
execute store result score @s floating_ui.f0 run data get entity 1bf52-0-0-0-0 Pos[0] 10000.0
execute store result score @s floating_ui.f1 run data get entity 1bf52-0-0-0-0 Pos[1] 10000.0
execute store result score @s floating_ui.f2 run data get entity 1bf52-0-0-0-0 Pos[2] 10000.0
tp 1bf52-0-0-0-0 .0 .0 .0
data remove storage floating_ui:debug curr[0]