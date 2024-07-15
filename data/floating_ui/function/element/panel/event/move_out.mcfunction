#> floating_ui:element/panel/event/move_out
# @internal

#say moveout

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/event/move_out"
data modify storage floating_ui:temp move.child prepend from entity @s item.components.minecraft:custom_data.data.childPoint
function floating_ui:element/panel/event/move_out_walk_child
data remove storage floating_ui:temp move.child[0]

function floating_ui:element/control/event/move_out
    
data remove storage floating_ui:debug curr[0]