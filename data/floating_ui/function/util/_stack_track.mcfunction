data modify storage floating_ui:debug temp set from storage floating_ui:debug curr
function floating_ui:util/tree/print_root with entity @s {}
tellraw @a [{"nbt":"temp[0]","storage": "floating_ui:debug","bold":true}]
data remove storage floating_ui:debug temp[0]
scoreboard players set count floating_ui.temp 0
function floating_ui:util/stack_track/walk