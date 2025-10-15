#> floating_ui:element/panel/event/move_out
# @internal

#say moveout



function floating_ui:element/control/event/move_out

execute on passengers if entity @s[tag=floating_ui_legacy_lookedAt] run function floating_ui:element/panel/event/move_out_walk_child
    
