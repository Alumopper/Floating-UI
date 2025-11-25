#> floating_ui:element/textblock/event/move_event
#@internal


execute store result score @s floating_ui.re run function floating_ui:element/textcontrol/event/pos_check

scoreboard players set if-else floating_ui.temp 0


execute if score @s floating_ui.re matches 0 if entity @s[tag=floating_ui_legacy_lookedAt] on passengers run function floating_ui:element/textblock/event/move_out
execute if score @s floating_ui.re matches 1 if entity @s[tag=floating_ui_legacy_lookedAt] on passengers run function floating_ui:element/textblock/event/move
execute if score @s floating_ui.re matches 1 if entity @s[tag=!floating_ui_legacy_lookedAt] on passengers run function floating_ui:element/textblock/event/move_in


