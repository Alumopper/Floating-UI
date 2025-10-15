#x方向上的
execute store result score child_x _ run data get storage floating_ui:temp child[-1][0].x 10000
execute store result score parent_x _ run data get entity @s item.components.minecraft:custom_data.data.ui.size[0] 5000
execute if score child_x _ matches ..0 run scoreboard players operation child_x _ *= -1 int
scoreboard players operation parent_x _ -= child_x _
execute unless score parent_x _ matches 0.. run function log:_warn {"msg":"Child x is out of parent x"}
#y方向上的
execute store result score child_y _ run data get storage floating_ui:temp child[-1][0].y 10000
execute store result score parent_y _ run data get entity @s item.components.minecraft:custom_data.data.ui.size[1] 5000
execute if score child_y _ matches ..0 run scoreboard players operation child_y _ *= -1 int
scoreboard players operation parent_y _ -= child_y _
execute unless score parent_y _ matches 0.. run function log:_warn {"msg":"Child y is out of parent y"}
#写入
data modify storage floating_ui:temp child[-1][0].size set value [0f,0f]
execute store result storage floating_ui:temp child[-1][0].size[0] float 0.0002 run scoreboard players get parent_x _
execute store result storage floating_ui:temp child[-1][0].size[1] float 0.0002 run scoreboard players get parent_y _