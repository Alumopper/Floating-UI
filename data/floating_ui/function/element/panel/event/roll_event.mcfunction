#> floating_ui:element/panel/event/roll_event
# panel没有点击的事件，但是需要把事件遍历到子元素上
# @internal


execute unless function floating_ui:element/control/event/pos_check run 
execute unless function floating_ui:element/control/event/pos_check run return 0

execute on passengers run function floating_ui:element/panel/event/roll_walk_child

