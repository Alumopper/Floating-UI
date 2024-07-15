#> floating_ui:element/button/event/left_click
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/button/event/left_click"
data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.left_click
function floating_ui:util/function with storage floating_ui:temp arg.function

say left_click
data remove storage floating_ui:debug curr[0]