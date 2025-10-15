#> floating_ui:.player_dispose_ui
# 清除和这个玩家有关的所有ui


tag @s add floating_ui_owner
execute as @e[tag=floating_ui_root] if score @s floating_ui.uid = @p[tag=floating_ui_owner] floating_ui.uid run function floating_ui:_dispose_ui
tag @s remove floating_ui_owner
