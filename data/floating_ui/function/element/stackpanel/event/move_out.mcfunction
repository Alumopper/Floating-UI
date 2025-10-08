#> floating_ui:element/stackpanel/event/move_out
# @internal

#say moveout

data modify storage floating_ui:debug curr prepend value "floating_ui:element/stackpanel/event/move_out"

function floating_ui:element/control/event/move_out

execute on passengers if entity @s[tag=floating_ui_legacy_lookedAt] run function floating_ui:element/stackpanel/event/move_out_walk_child
    
data remove storage floating_ui:debug curr[0]