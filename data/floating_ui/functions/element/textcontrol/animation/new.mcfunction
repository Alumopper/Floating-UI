data modify storage floating_ui:temp anim.data set from entity @s data.ui.anim.new.value
data modify storage floating_ui:temp anim.time set from entity @s data.ui.anim.new.time
data modify entity @s start_interpolation set value 0
function floating_ui:element/control/animation/walk_anim_data

data modify storage floating_ui:temp arg.function set from entity @s data.ui.anim.new.start
function floating_ui:util/function with storage floating_ui:temp arg

#事件队列
data modify storage floating_ui:temp arg.function set from entity @s data.ui.anim.new.end
data modify storage floating_ui:temp arg.time set from entity @s data.ui.anim.new.time
function floating_ui:util/_add_animation_event with storage floating_ui:temp arg