#> floating_ui:element/panel/event/click_event
# panel没有点击的事件，但是需要把事件遍历到子元素上
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/event/click_event"
execute unless function floating_ui:element/control/event/pos_check run data remove storage floating_ui:debug curr[0]
execute unless function floating_ui:element/control/event/pos_check run return 0

execute on passengers run function floating_ui:element/panel/event/click_walk_child

data remove storage floating_ui:debug curr[0]