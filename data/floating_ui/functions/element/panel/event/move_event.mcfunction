#> floating_ui:element/panel/event/move_event
#@internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/event/move_event"
execute store result score re _ run function floating_ui:element/control/event/pos_check

execute if score re _ matches 0 if entity @s[tag=floating_ui_lookedAt] run function floating_ui:element/panel/event/move_out
execute if score re _ matches 1 if entity @s[tag=floating_ui_lookedAt] run function floating_ui:element/panel/event/move
execute if score re _ matches 1 if entity @s[tag=!floating_ui_lookedAt] run function floating_ui:element/panel/event/move_in

data remove storage floating_ui:debug curr[0]