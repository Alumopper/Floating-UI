#> floating_ui:element/control/event/roll
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/control/event/roll"
data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.roll
function floating_ui:util/function with storage floating_ui:temp arg

tag @s add floating_ui_lookedAt
data remove storage floating_ui:debug curr[0]