#> floating_ui:.player_dispose_ui
# 清除和这个玩家有关的所有ui

data modify storage floating_ui:debug curr prepend value "floating_ui:.player_dispose_ui"
tag @s add floating_ui_owner
execute as @e[tag=floating_ui_root] if score @s floating_ui.uid = @p[tag=floating_ui_owner] floating_ui.uid run function floating_ui:_dispose_ui
tag @s remove floating_ui_owner
data remove storage floating_ui:debug curr[0]