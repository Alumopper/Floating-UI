#> floating_ui:element/control/_play_animate
# 使这个控件执行一个动画效果
# @api
# @input storage floating_ui:input animate.arg

data modify storage floating_ui:temp anim.data set from storage floating_ui:input animate.arg.value
data modify storage floating_ui:temp anim.time set from storage floating_ui:input animate.arg.time
data modify entity @s start_interpolation set value 0
function floating_ui:element/control/animation/walk_anim_data

data modify storage floating_ui:temp arg.function set from storage floating_ui:input animate.arg.start
function floating_ui:util/function with storage floating_ui:temp arg

#事件队列
data modify storage floating_ui:temp arg.function set from storage floating_ui:input animate.arg.end
data modify storage floating_ui:temp arg.time set from storage floating_ui:input animate.arg.time
function floating_ui:util/_add_animation_event with storage floating_ui:temp arg