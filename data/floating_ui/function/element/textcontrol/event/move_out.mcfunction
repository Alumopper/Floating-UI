#> floating_ui:element/textcontrol/event/move_out
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textcontrol/event/move_out"
data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.move_out
function floating_ui:util/function with storage floating_ui:temp arg.function
tag @s remove floating_ui_lookedAt
data remove storage floating_ui:debug curr[0]