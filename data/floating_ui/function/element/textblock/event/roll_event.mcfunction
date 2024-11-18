#> floating_ui:element/button/event/roll
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textblock/event/roll"
function floating_ui:element/textcontrol/event/roll
data remove storage floating_ui:debug curr[0]