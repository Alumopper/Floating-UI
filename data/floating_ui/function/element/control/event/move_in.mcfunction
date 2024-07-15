#> floating_ui:element/control/event/move_in
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/control/event/move_in"
data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.move_in
function floating_ui:util/function with storage floating_ui:temp arg

#动画
execute if data entity @s item.components.minecraft:custom_data.data.ui.anim.move_in run function floating_ui:element/control/animation/move_in

tag @s add floating_ui_lookedAt
data remove storage floating_ui:debug curr[0]