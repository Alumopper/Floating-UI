#> floating_ui:element/list/event/move_out
# @internal

function floating_ui:element/control/event/move_out

execute if score event_handled floating_ui.temp matches 0 on passengers run function floating_ui:element/list/event/move_out_walk_child
    
