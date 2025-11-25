#> floating_ui:element/panel/event/move
# @internal

#say move



function floating_ui:element/control/event/move

execute if score event_handled floating_ui.temp matches 0 on passengers run function floating_ui:element/panel/event/move_walk_child

