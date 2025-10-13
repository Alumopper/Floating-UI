#> floating_ui:element/control/event/roll
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/control/event/roll"

#update the value
scoreboard players operation @s floating_ui.numberbox.value += slot _
execute if score @s floating_ui.numberbox.value > @s floating_ui.numberbox.max run scoreboard players operation @s floating_ui.numberbox.value = @s floating_ui.numberbox.max
execute if score @s floating_ui.numberbox.value < @s floating_ui.numberbox.min run scoreboard players operation @s floating_ui.numberbox.value = @s floating_ui.numberbox.min
#update text
data modify storage floating_ui:input temp set value {}
execute store result storage floating_ui:input temp.text int 1.0 run scoreboard players get @s floating_ui.numberbox.value
execute on passengers on passengers run function floating_ui:element/textblock/_set_text

data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.roll
function floating_ui:util/function with storage floating_ui:temp arg

tag @s add floating_ui_lookedAt
data remove storage floating_ui:debug curr[0]