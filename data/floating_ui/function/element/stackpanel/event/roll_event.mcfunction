#> floating_ui:element/stackpanel/event/roll_event
# panel没有点击的事件，但是需要把事件遍历到子元素上
# @internal


execute unless function floating_ui:element/control/event/pos_check run return 0

function floating_ui:element/control/event/roll_event

execute if score event_handled floating_ui.temp matches 0 on passengers run function floating_ui:element/stackpanel/event/roll_walk_child

