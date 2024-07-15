data modify storage floating_ui:debug temp set from storage floating_ui:debug curr
tellraw @a [{"nbt":"temp[0]","storage": "floating_ui:debug","bold":true}]
data remove storage floating_ui:debug temp[0]
function floating_ui:util/stack_track/walk