#> floating_ui:interact/move_out/trigger
data modify storage floating_ui:debug curr prepend value "floating_ui:interact/move_out/trigger"
$function floating_ui:element/$(type)/event/move_out
data remove storage floating_ui:debug curr[0]