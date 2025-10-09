#> floating_ui:element/<control_id>/event/move_event
#@internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/sprite/event/move_event"
execute store result score @s floating_ui.re run function floating_ui:element/control/event/pos_check

# replace <control_id> with the id of your custom control
#execute if score @s floating_ui.re matches 0 if entity @s[tag=floating_ui_legacy_lookedAt] run function floating_ui:element/#<control_id>/event/move_out
#execute if score @s floating_ui.re matches 1 if entity @s[tag=floating_ui_legacy_lookedAt] run function floating_ui:element/#<control_id>/event/move
#execute if score @s floating_ui.re matches 1 if entity @s[tag=!floating_ui_legacy_lookedAt] run function floating_ui:element/#<control_id>/event/move_in

data remove storage floating_ui:debug curr[0]