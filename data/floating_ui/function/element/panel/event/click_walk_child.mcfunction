#> floating_ui:element/panel/event/click_walk_child
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/event/click_walk_child"
data modify storage floating_ui:temp arg.type set from entity @s item.components.minecraft:custom_data.data.ui.type
function floating_ui:interact/click/trigger with storage floating_ui:temp arg
data remove storage floating_ui:debug curr[0]