#> floating_ui:element/control/_play_animation
#播放一个动画
#参数：
# - storage floating_ui:input animate.id 一个id
# - score delay _ = 0 动画播放延迟(t)
# - storage floating_ui:input animate.data 一个有效的动画数据

#立刻触发
execute if score delay _ matches ..0 run data modify storage floating_ui:temp anim set from storage floating_ui:input animate.data
execute if score delay _ matches ..0 run return run function floating_ui:element/control/animation/custom_do

execute unless data storage floating_ui:input animate.id run return run tellraw @a "Missing animation id"
function timelist:_reset
function floating_ui:element/control/set_animation with storage floating_ui:input animate
function floating_ui:element/control/add_animation_event with storage floating_ui:input animate
function timelist:_setasat
scoreboard players operation inp int = delay _
function timelist:_setdelay
function timelist:_append