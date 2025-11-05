#this method will still trigger value_change event, value_exceed_max event and value_below_max event

#@input value floating_ui.temp

execute unless score value floating_ui.temp matches -2147483648..2147483647 run return fail

#update the value
scoreboard players operation @s floating_ui.numberbox.value += value floating_ui.temp
execute unless score value floating_ui.temp matches 0 run data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.roll
execute unless score value floating_ui.temp matches 0 run function floating_ui:util/function with storage floating_ui:temp arg

scoreboard players set exceed floating_ui.temp 0
execute store success score exceed floating_ui.temp if score @s floating_ui.numberbox.value > @s floating_ui.numberbox.max run scoreboard players operation @s floating_ui.numberbox.value = @s floating_ui.numberbox.max
execute unless score exceed floating_ui.temp matches 0 run data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.value_exceed_max
execute unless score exceed floating_ui.temp matches 0 run function floating_ui:util/function with storage floating_ui:temp arg

scoreboard players set below floating_ui.temp 0
execute store success score below floating_ui.temp if score @s floating_ui.numberbox.value < @s floating_ui.numberbox.min run scoreboard players operation @s floating_ui.numberbox.value = @s floating_ui.numberbox.min
execute unless score exceed floating_ui.temp matches 0 run data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.value_below_min
execute unless score below floating_ui.temp matches 0 run function floating_ui:util/function with storage floating_ui:temp arg

#update text
data modify storage floating_ui:input temp set value {}
execute store result storage floating_ui:input temp.text int 1.0 run scoreboard players get @s floating_ui.numberbox.value
execute on passengers on passengers run function floating_ui:element/textblock/_set_text

scoreboard players reset value floating_ui.temp

return 1