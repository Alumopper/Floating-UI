scoreboard players operation uid floating_ui.temp = @s csch.marker.lectern.ui
execute as @e[tag=floating_ui_root, distance=0..6] if score @s floating_ui.uid = uid floating_ui.temp run function floating_ui:_dispose_ui
tag @s remove csch_atri_lectern_displaying