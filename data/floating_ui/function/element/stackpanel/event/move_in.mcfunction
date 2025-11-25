#> floating_ui:element/stackpanel/event/move_in
# @internal

#say movein



function floating_ui:element/control/event/move_in

execute if score event_handled floating_ui.temp matches 0 on passengers run function floating_ui:element/stackpanel/event/move_walk_child

