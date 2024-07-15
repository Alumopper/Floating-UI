#> floating_ui:element/panel/move_child
# @within floating_ui:element/panel/_move

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/move_child"

execute on passengers run function floating_ui:macro/move_control with entity @s item.components.minecraft:custom_data.data.ui

data remove storage floating_ui:debug curr[0]