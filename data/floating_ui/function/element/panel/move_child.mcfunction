#> floating_ui:element/panel/move_child
# @within floating_ui:element/panel/_move

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/move_child"
execute store result score length _ run data get entity @s item.components.minecraft:custom_data.data.childPoint
execute if score length _ matches 0 run data remove storage floating_ui:debug curr[0]
execute if score length _ matches 0 run return 1
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s item.components.minecraft:custom_data.data.childPoint[0]
function floating_ui:macro/move_control with entity @s item.components.minecraft:custom_data.data.ui.child[-1]
data remove entity @s item.components.minecraft:custom_data.data.childPoint[0]
data remove entity @s item.components.minecraft:custom_data.data.ui.child[-1]
function floating_ui:element/panel/move_child
data remove storage floating_ui:debug curr[0]