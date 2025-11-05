#this method won't trigger any event

#@input value floating_ui.temp

execute unless score value floating_ui.temp matches -2147483648..2147483647 run return fail

#update the value
scoreboard players operation @s floating_ui.numberbox.value = value floating_ui.temp
execute if score @s floating_ui.numberbox.value > @s floating_ui.numberbox.max run scoreboard players operation @s floating_ui.numberbox.value = @s floating_ui.numberbox.max
execute if score @s floating_ui.numberbox.value < @s floating_ui.numberbox.min run scoreboard players operation @s floating_ui.numberbox.value = @s floating_ui.numberbox.min

#update text
data modify storage floating_ui:input temp set value {}
execute store result storage floating_ui:input temp.text int 1.0 run scoreboard players get @s floating_ui.numberbox.value
execute on passengers on passengers run function floating_ui:element/textblock/_set_text

return 1