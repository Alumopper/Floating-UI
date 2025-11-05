#> floating_ui:element/control/event/roll
# @internal

execute unless function floating_ui:element/control/event/pos_check run return 0

#update the value
scoreboard players operation @s floating_ui.numberbox.value -= value floating_ui.temp
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

data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.roll
function floating_ui:util/function with storage floating_ui:temp arg

tag @s add floating_ui_lookedAt
