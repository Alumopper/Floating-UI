scoreboard players operation value floating_ui.temp = @s csch.ui.numberbox_group.value
scoreboard players operation value floating_ui.temp /= 100 int
execute on passengers if entity @s[tag=2] run function floating_ui:element/numberbox/_set_value_silent

scoreboard players operation value floating_ui.temp = @s csch.ui.numberbox_group.value
scoreboard players operation value floating_ui.temp %= 100 int
scoreboard players operation value floating_ui.temp /= 10 int
execute on passengers if entity @s[tag=1] run function floating_ui:element/numberbox/_set_value_silent

scoreboard players operation value floating_ui.temp = @s csch.ui.numberbox_group.value
scoreboard players operation value floating_ui.temp %= 10 int
execute on passengers if entity @s[tag=0] run function floating_ui:element/numberbox/_set_value_silent
