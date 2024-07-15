#> floating_ui:interact/move/trigger
# @internal
data modify storage floating_ui:debug curr prepend value "floating_ui:interact/move/trigger"
$function floating_ui:element/$(type)/event/move_event
data remove storage floating_ui:debug curr[0]