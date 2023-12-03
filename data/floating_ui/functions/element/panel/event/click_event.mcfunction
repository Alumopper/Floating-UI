#> floating_ui:element/panel/event/click_event
# panel没有点击的事件，但是需要把事件遍历到子元素上
# @internal

execute unless function floating_ui:element/control/event/pos_check run return 0

data modify storage floating_ui:temp click.child prepend from entity @s item.tag.data.childPoint
function floating_ui:element/panel/event/click_walk_child
data remove storage floating_ui:temp click.child[0]
