#> floating_ui:element/control/event/pos_check
#是否落在平面内
# @internal



scoreboard players operation this.u floating_ui.temp = return_u floating_ui.temp
scoreboard players operation this.v floating_ui.temp = return_v floating_ui.temp
scoreboard players operation this.u floating_ui.temp -= @s floating_ui.root_x
scoreboard players operation this.v floating_ui.temp -= @s floating_ui.root_y
execute store result score width floating_ui.temp run data get entity @s transformation.scale[0] 5000.0
execute store result score height floating_ui.temp run data get entity @s transformation.scale[1] 5000.0
scoreboard players operation this.u floating_ui.temp += width floating_ui.temp
scoreboard players operation this.v floating_ui.temp += height floating_ui.temp
scoreboard players operation width floating_ui.temp *= 2 int
scoreboard players operation height floating_ui.temp *= 2 int

execute if score this.u floating_ui.temp matches 0.. if score this.u floating_ui.temp <= width floating_ui.temp if score this.v floating_ui.temp matches 0.. if score this.v floating_ui.temp <= height floating_ui.temp run return 1
return 0