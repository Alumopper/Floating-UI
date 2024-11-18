#> floating_ui:interact/roll/trigger
data modify storage floating_ui:debug curr prepend value "floating_ui:interact/roll/trigger"
$function floating_ui:element/$(type)/event/roll_event
data remove storage floating_ui:debug curr[0]