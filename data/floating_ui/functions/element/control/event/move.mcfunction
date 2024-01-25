#> floating_ui:element/control/event/move
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/control/event/move"
data modify storage floating_ui:temp arg.function set from entity @s item.tag.data.move
function floating_ui:util/function with storage floating_ui:temp arg

tag @s add floating_ui_lookedAt
data remove storage floating_ui:debug curr[0]