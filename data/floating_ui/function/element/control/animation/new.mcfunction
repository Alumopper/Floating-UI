#传入动画数据
data modify storage floating_ui:temp anim.data set from entity @s item.components.minecraft:custom_data.data.ui.anim.new.value
data modify entity @s interpolation_duration set from entity @s item.components.minecraft:custom_data.data.ui.anim.new.time
execute if data entity @s item.components.minecraft:custom_data.data.ui.anim.new.delay run data modify entity @s start_interpolation set from entity @s item.components.minecraft:custom_data.data.ui.anim.new.delay
execute unless data entity @s item.components.minecraft:custom_data.data.ui.anim.new.delay run data modify entity @s start_interpolation set value 0

#设置动画数据
function floating_ui:element/control/animation/walk_anim_data

#触发事件start
data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.ui.anim.new.start
function floating_ui:util/function with storage floating_ui:temp arg

#事件队列，在动画结束以后触发事件end
execute unless data entity @s item.components.minecraft:custom_data.data.ui.anim.new.end run return 0
data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.ui.anim.new.end
data modify storage floating_ui:temp arg.time set from entity @s item.components.minecraft:custom_data.data.ui.anim.new.time
function floating_ui:util/_add_animation_event with storage floating_ui:temp arg
data remove storage floating_ui:temp arg
data remove storage floating_ui:temp anim

