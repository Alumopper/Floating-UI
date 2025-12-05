#> floating_ui:element/control/_play_animation
#播放一个动画
#参数：
# - storage floating_ui:input animate.data 一个有效的动画数据

data modify storage floating_ui:temp anim set from storage floating_ui:input animate.data
return run function floating_ui:element/textcontrol/animation/custom_do