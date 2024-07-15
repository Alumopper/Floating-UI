#> floating_ui:element/panel/event/move_in
# @internal

#say movein

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/event/move_in"
execute on passengers run function floating_ui:element/panel/event/move_walk_child

function floating_ui:element/control/event/move_in

data remove storage floating_ui:debug curr[0]