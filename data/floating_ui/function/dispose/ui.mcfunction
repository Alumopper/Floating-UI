#> floating_ui:dispose/ui
# @internal
scoreboard players set test floating_ui.temp 0
execute as @a[tag=floating_ui_hasUI,distance=..20] if score test floating_ui.temp matches 0 store success score test floating_ui.temp if score @s floating_ui.uid = @n[tag=floating_ui_root] floating_ui.uid
execute if score test floating_ui.temp matches 0 run function floating_ui:_dispose_ui