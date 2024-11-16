#> floating_ui:element/list/event/move
# @internal

#say move

data modify storage floating_ui:debug curr prepend value "floating_ui:element/list/event/move"

function floating_ui:element/control/event/move

execute on passengers run function floating_ui:element/list/event/move_walk_child

data remove storage floating_ui:debug curr[0]