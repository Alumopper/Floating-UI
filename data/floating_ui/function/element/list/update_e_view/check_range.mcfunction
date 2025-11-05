scoreboard players operation content_height floating_ui.temp -= @s floating_ui.size1
execute if score content_height floating_ui.temp matches ..-1 run return run scoreboard players set stop floating_ui.temp 1
scoreboard players add end_index floating_ui.temp 1