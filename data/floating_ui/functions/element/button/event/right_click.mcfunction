#> floating_ui:element/button/event/right_click
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/button/event/right_click"
data modify storage floating_ui:temp arg.function set from entity @s item.tag.data.right_click
function floating_ui:util/function with storage floating_ui:temp arg.function

say right_click
data remove storage floating_ui:debug curr[0]