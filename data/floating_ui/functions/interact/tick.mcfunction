#> floating_ui:interact/tick
data modify storage floating_ui:debug curr prepend value "floating_ui:interact/tick"
tag @e[tag=floating_ui_lookedAt] add floating_ui_legacy_lookedAt
tag @e[tag=floating_ui_lookedAt] remove floating_ui_lookedAt
# 交互
execute as @a[tag=floating_ui_hasUI] at @s run function floating_ui:interact/player_tick
# 如果没有被看着了，触发离开事件
execute as @e[type=marker,tag=floating_ui_legacy_lookedAt] unless entity @s[tag=floating_ui_lookedAt] run function floating_ui:interact/move_out/check
tag @e[tag=floating_ui_legacy_lookedAt] remove floating_ui_legacy_lookedAt
data remove storage floating_ui:debug curr[0]