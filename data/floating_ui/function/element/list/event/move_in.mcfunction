#> floating_ui:element/list/event/move_in
# @internal

function floating_ui:element/control/event/move_in

execute if score event_handled floating_ui.temp matches 0 on passengers run function floating_ui:element/list/event/move_walk_child

