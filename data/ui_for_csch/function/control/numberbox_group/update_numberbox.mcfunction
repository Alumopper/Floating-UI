scoreboard players operation value floating_ui.temp = @s floating_ui.numberbox.value
scoreboard players operation value floating_ui.temp /= 100 int
execute on passengers if entity @s[tag=2] run function floating_ui:element/numberbox/_set_value

scoreboard players operation value floating_ui.temp = @s floating_ui.numberbox.value
scoreboard players operation value floating_ui.temp %= 100 int
scoreboard players operation value floating_ui.temp /= 10 int
execute on passengers if entity @s[tag=1] run function floating_ui:element/numberbox/_set_value

scoreboard players operation value floating_ui.temp = @s floating_ui.numberbox.value
scoreboard players operation value floating_ui.temp %= 10 int
execute on passengers if entity @s[tag=0] run function floating_ui:element/numberbox/_set_value
