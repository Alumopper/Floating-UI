#> floating_ui:ray/if_ray_ui
# 检测是否击打了UI
# @internal
# @context as @s 玩家
# @output data floating_ui.temp floating_ui.return 戳到的最近的UI
# @output score return_u floating_ui.temp 
# @output score return_v floating_ui.temp


data remove storage floating_ui:temp floating_ui.return
tag @s add floating_ui_curr
#初始化比较
scoreboard players set min_stempt floating_ui.temp 100000000
#开始求最近交点
execute as @e[tag=floating_ui_checkingUI,distance=..20] run function floating_ui:ray/move/root_check_point
tag @s remove floating_ui_curr
