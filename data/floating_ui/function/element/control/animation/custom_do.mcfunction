data modify storage floating_ui:temp anim.data set from storage floating_ui:temp anim.value
data modify entity @s interpolation_duration set from storage floating_ui:temp anim.time
execute if data storage floating_ui:temp anim.delay run data modify entity @s start_interpolation set from entity @s item.components.minecraft:custom_data.data.ui.anim.move_out.delay
execute unless data storage floating_ui:temp anim.delay run data modify entity @s start_interpolation set value 0
function floating_ui:element/control/animation/walk_anim_data

data modify storage floating_ui:temp arg.function set from storage floating_ui:temp anim.start
function floating_ui:util/function


#事件队列
execute unless data storage floating_ui:temp anim.end run return 0
data modify storage floating_ui:temp arg.function set from storage floating_ui:temp anim.end
data modify storage floating_ui:temp arg.time set from storage floating_ui:temp anim.time
function floating_ui:util/_add_animation_event with storage floating_ui:temp arg
data remove storage floating_ui:temp arg
data remove storage floating_ui:temp anim