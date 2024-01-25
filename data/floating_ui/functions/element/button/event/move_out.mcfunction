#> floating_ui:element/button/event/move_out
data modify storage floating_ui:debug curr prepend value "floating_ui:element/button/event/move_out"
function floating_ui:element/control/event/move_out
data remove storage floating_ui:debug curr[0]
