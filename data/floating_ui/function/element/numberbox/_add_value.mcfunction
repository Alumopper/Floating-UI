#this method will still trigger value_change event, value_exceed_max event and value_below_max event

#@input value floating_ui.temp

execute unless score value floating_ui.temp matches -2147483648..2147483647 run return fail


#update the value
scoreboard players operation value floating_ui.temp += @s floating_ui.numberbox.value
function floating_ui:element/numberbox/update_value

return 1