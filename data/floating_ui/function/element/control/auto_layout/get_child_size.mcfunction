#x方向上的
execute store result score child_x floating_ui.temp run data get storage floating_ui:temp child[-1][0].x 10000
execute store result score parent_x floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.ui.size[0] 5000
execute if score child_x floating_ui.temp matches ..0 run scoreboard players operation child_x floating_ui.temp *= -1 int
scoreboard players operation parent_x floating_ui.temp -= child_x floating_ui.temp
execute unless score parent_x floating_ui.temp matches 0.. run function log:_warn {"msg":"Child x is out of parent x"}
#y方向上的
execute store result score child_y floating_ui.temp run data get storage floating_ui:temp child[-1][0].y 10000
execute store result score parent_y floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.ui.size[1] 5000
execute if score child_y floating_ui.temp matches ..0 run scoreboard players operation child_y floating_ui.temp *= -1 int
scoreboard players operation parent_y floating_ui.temp -= child_y floating_ui.temp
execute unless score parent_y floating_ui.temp matches 0.. run function log:_warn {"msg":"Child y is out of parent y"}
#写入
data modify storage floating_ui:temp child[-1][0].size set value [0f,0f]
execute store result storage floating_ui:temp child[-1][0].size[0] float 0.0002 run scoreboard players get parent_x floating_ui.temp
execute store result storage floating_ui:temp child[-1][0].size[1] float 0.0002 run scoreboard players get parent_y floating_ui.temp