#> floating_ui:element/panel/event/move
# @internal

#say move
data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/event/move"

function floating_ui:element/panel/event/move_walk_child

function floating_ui:element/control/event/move
data remove storage floating_ui:debug curr[0]