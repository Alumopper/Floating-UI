#> floating_ui:interact/tick


# tag替换
tag @e[tag=floating_ui_lookedAt] add floating_ui_legacy_lookedAt
tag @e[tag=floating_ui_lookedAt] remove floating_ui_lookedAt

# 交互
tag @a[tag=floating_ui_hasUI] add floating_ui_canInteractUI
execute as @a at @s if entity @e[distance=..20,scores={floating_ui.uid=..-1}, tag=floating_ui_root] run tag @s add floating_ui_canInteractUI
execute as @a[tag=floating_ui_canInteractUI] at @s run function floating_ui:interact/player_tick

tag @a[tag=floating_ui_canInteractUI] remove floating_ui_canInteractUI

# 如果没有被看着了，触发离开事件
execute as @e[tag=floating_ui_root,tag=floating_ui_legacy_lookedAt] unless entity @s[tag=floating_ui_lookedAt] run function floating_ui:interact/move_out/check
tag @e[tag=floating_ui_legacy_lookedAt] remove floating_ui_legacy_lookedAt

