#> floating_ui:element/textblock/event/move_event
#@internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textblock/event/move_event"
execute store result score @s floating_ui.re run function floating_ui:element/textcontrol/event/pos_check

scoreboard players set if-else _ 0


execute if score @s floating_ui.re matches 0 if entity @s[tag=floating_ui_legacy_lookedAt] run function floating_ui:element/textblock/event/move_out
execute if score @s floating_ui.re matches 1 if entity @s[tag=floating_ui_legacy_lookedAt] run function floating_ui:element/textblock/event/move
execute if score @s floating_ui.re matches 1 if entity @s[tag=!floating_ui_legacy_lookedAt] run function floating_ui:element/textblock/event/move_in


data remove storage floating_ui:debug curr[0]