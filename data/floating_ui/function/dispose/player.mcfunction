#> floating_ui:dispose/player
# 玩家的浮动UI的自动销毁
# @internal

tag @s add floating_ui_owner
execute as @e[tag=floating_ui_root,distance=..30] if score @s floating_ui.uid = @p[tag=floating_ui_owner] floating_ui.uid at @s unless entity @a[tag=floating_ui_owner,distance=..20] run function floating_ui:_dispose_ui
#检查还有没有持有的浮动UI
scoreboard players set test floating_ui.temp 0
scoreboard players operation curr_player_uid floating_ui.temp = @s floating_ui.uid
execute store result score test floating_ui.temp as @e[tag=floating_ui_root] if score @s floating_ui.uid = curr_player_uid floating_ui.temp
execute if score test floating_ui.temp matches 0 run tag @s remove floating_ui_hasUI
tag @s remove floating_ui_owner
