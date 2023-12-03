#> floating_ui:element/panel/event/move
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/event/move"
data modify storage floating_ui:temp move.child prepend from entity @s item.tag.data.childPoint
function floating_ui:element/panel/event/move_walk_child
data remove storage floating_ui:temp move.child[0]

function floating_ui:element/control/event/move
data remove storage floating_ui:debug curr[0]