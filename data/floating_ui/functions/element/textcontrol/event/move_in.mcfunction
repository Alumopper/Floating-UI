#> floating_ui:element/textcontrol/event/move_in
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textcontrol/event/move_in"
data modify storage floating_ui:temp arg.function set from entity @s item.tag.data.move_in
function floating_ui:util/function with storage floating_ui:temp arg.function
tag @s add floating_ui_lookedAt
data remove storage floating_ui:debug curr[0]