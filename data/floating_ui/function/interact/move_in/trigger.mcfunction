#> floating_ui:interact/move_in/trigger
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:interact/move_in/trigger"
$function floating_ui:element/$(type)/event/move_in
data remove storage floating_ui:debug curr[0]