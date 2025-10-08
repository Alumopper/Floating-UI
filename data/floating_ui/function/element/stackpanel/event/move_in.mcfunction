#> floating_ui:element/stackpanel/event/move_in
# @internal

#say movein

data modify storage floating_ui:debug curr prepend value "floating_ui:element/stackpanel/event/move_in"

function floating_ui:element/control/event/move_in

execute on passengers run function floating_ui:element/stackpanel/event/move_walk_child

data remove storage floating_ui:debug curr[0]