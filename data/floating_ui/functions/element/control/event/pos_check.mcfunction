#> floating_ui:element/control/event/pos_check
#是否落在平面内
# @internal


scoreboard players operation this.u _ = return_u _
scoreboard players operation this.v _ = return_v _
scoreboard players operation this.u _ -= @s floating_ui.u
scoreboard players operation this.v _ -= @s floating_ui.v
execute store result score width _ run data get entity @s transformation.scale[0] 5000.0
execute store result score height _ run data get entity @s transformation.scale[1] 5000.0
scoreboard players operation this.u _ += width _
scoreboard players operation this.v _ += height _
scoreboard players operation width _ *= 2 int
scoreboard players operation height _ *= 2 int
execute if score this.u _ matches 0.. if score this.u _ <= width _ if score this.v _ matches 0.. if score this.v _ <= height _ run return 1
return 0