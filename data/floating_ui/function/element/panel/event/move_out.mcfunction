#> floating_ui:element/panel/event/move_out
# @internal

#say moveout

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/event/move_out"

function floating_ui:element/panel/event/move_out_walk_child

function floating_ui:element/control/event/move_out
    
data remove storage floating_ui:debug curr[0]