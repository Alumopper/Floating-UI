#> floating_ui:element/textblock/event/move_in
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textblock/event/move_in"
#function floating_ui:util/_stack_track
function floating_ui:element/textcontrol/event/move_in
data remove storage floating_ui:debug curr[0]