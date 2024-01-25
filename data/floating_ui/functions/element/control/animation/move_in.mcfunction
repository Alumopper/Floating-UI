data modify storage floating_ui:temp anim.data set from entity @s item.tag.data.ui.anim.move_in.value
data modify storage floating_ui:temp anim.time set from entity @s item.tag.data.ui.anim.move_in.time
data modify entity @s start_interpolation set from entity @s item.tag.data.ui.anim.new.delay
function floating_ui:element/control/animation/walk_anim_data

data modify storage floating_ui:temp arg.function set from entity @s item.tag.data.ui.anim.move_in.start
function floating_ui:util/function with storage floating_ui:temp arg

#事件队列
data modify storage floating_ui:temp arg.function set from entity @s item.tag.data.ui.anim.move_in.end
data modify storage floating_ui:temp arg.time set from entity @s item.tag.data.ui.anim.move_in.time
function floating_ui:util/_add_animation_event with storage floating_ui:temp arg