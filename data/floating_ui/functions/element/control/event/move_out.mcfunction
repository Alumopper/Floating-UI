#> floating_ui:element/control/event/move_out
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/control/event/move_out"
data modify storage floating_ui:temp arg.function set from entity @s item.tag.data.move_out
function floating_ui:util/function with storage floating_ui:temp arg

#动画
execute if data entity @s item.tag.data.ui.anim.move_out run function floating_ui:element/control/animation/move_out

data remove storage floating_ui:debug curr[0]