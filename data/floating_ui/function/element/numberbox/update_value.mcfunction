
#update the value
scoreboard players operation delta floating_ui.temp = value floating_ui.temp
scoreboard players operation delta floating_ui.temp -= @s floating_ui.numberbox.value
scoreboard players operation @s floating_ui.numberbox.value = value floating_ui.temp

#trigger value_exceed_max event
scoreboard players set exceed floating_ui.temp 0
execute store success score exceed floating_ui.temp if score @s floating_ui.numberbox.value > @s floating_ui.numberbox.max run scoreboard players operation @s floating_ui.numberbox.value = @s floating_ui.numberbox.max
execute if score exceed floating_ui.temp matches 1 run data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.value_exceed_max
execute if score exceed floating_ui.temp matches 1 run function floating_ui:util/function

#trigger value_below_min event
scoreboard players set below floating_ui.temp 0
execute store success score below floating_ui.temp if score @s floating_ui.numberbox.value < @s floating_ui.numberbox.min run scoreboard players operation @s floating_ui.numberbox.value = @s floating_ui.numberbox.min
execute if score below floating_ui.temp matches 1 run data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.value_below_min
execute if score below floating_ui.temp matches 1 run function floating_ui:util/function

#check if the value has changed.
execute store success score value_change floating_ui.temp unless score delta floating_ui.temp matches 0 unless score exceed floating_ui.temp matches 1 unless score below floating_ui.temp matches 1
execute if score value_change floating_ui.temp matches 1 run data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.value_change
execute if score value_change floating_ui.temp matches 1 run function floating_ui:util/function

#update text
data modify storage floating_ui:input temp set value {}
execute store result storage floating_ui:input temp.text int 1.0 run scoreboard players get @s floating_ui.numberbox.value
execute on passengers on passengers run function floating_ui:element/textblock/_set_text

scoreboard players reset value floating_ui.temp
