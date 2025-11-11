#> floating_ui:element/control/event/roll
# @internal

execute unless function floating_ui:element/control/event/pos_check run return 0

#update the value
scoreboard players operation value floating_ui.temp = @s floating_ui.numberbox.value
scoreboard players operation value floating_ui.temp -= slot floating_ui.temp
function floating_ui:element/numberbox/update_value

#trigger custom roll event
data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.roll
function floating_ui:util/function

tag @s add floating_ui_lookedAt
