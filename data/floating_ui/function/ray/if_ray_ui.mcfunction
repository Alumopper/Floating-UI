#> floating_ui:ray/if_ray_ui
# 检测是否击打了UI
# @internal
# @context as @s 玩家
# @output data _ floating_ui.return 戳到的最近的UI
# @output score return_u _ 
# @output score return_v _

data modify storage floating_ui:debug curr prepend value "floating_ui:ray/if_ray_ui"
data remove storage floating_ui:temp floating_ui.return
tag @s add floating_ui_curr
#初始化比较
scoreboard players set min_stempt _ 100000000
#开始求最近交点
execute as @e[type=item_display,tag=floating_ui_root,distance=..20] if score @s floating_ui.uid = @p[tag=floating_ui_curr] floating_ui.uid run function floating_ui:ray/move/root_check_point
tag @s remove floating_ui_curr
data remove storage floating_ui:debug curr[0]