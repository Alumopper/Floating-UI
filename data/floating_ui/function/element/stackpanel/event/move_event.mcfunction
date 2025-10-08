#> floating_ui:element/stackpanel/event/move_event
#@internal

#say move_event

data modify storage floating_ui:debug curr prepend value "floating_ui:element/stackpanel/event/move_event"
execute store result score @s floating_ui.re run function floating_ui:element/control/event/pos_check

execute if score @s floating_ui.re matches 0 if entity @s[tag=floating_ui_legacy_lookedAt] run function floating_ui:element/stackpanel/event/move_out
execute if score @s floating_ui.re matches 1 if entity @s[tag=floating_ui_legacy_lookedAt] run function floating_ui:element/stackpanel/event/move
execute if score @s floating_ui.re matches 1 if entity @s[tag=!floating_ui_legacy_lookedAt] run function floating_ui:element/stackpanel/event/move_in

data remove storage floating_ui:debug curr[0]