#> floating_ui:dispose/ui
# @internal
scoreboard players set test _ 0
execute as @a[tag=floating_ui_hasUI,distance=..20] if score test _ matches 0 store success score test _ if score @s uid = @e[tag=floating_ui_root,sort=nearest,limit=1] floating_ui.uid
execute if score test _ matches 0 run function floating_ui:_dispose_ui