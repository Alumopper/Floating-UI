#> floating_ui:clock/40
# @within floating_ui:clock/tick

data modify storage floating_ui:debug curr prepend value "floating_ui:clock/40"
scoreboard players set clock.40 floating_ui.clock 0
#执行
execute as @e[tag=floating_ui_root,scores={floating_ui.uid=0..}] at @s run function floating_ui:dispose/ui
data remove storage floating_ui:debug curr[0]