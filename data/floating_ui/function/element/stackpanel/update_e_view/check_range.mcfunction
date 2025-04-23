scoreboard players operation content_height _ -= @s floating_ui.size1
execute if score content_height _ matches ..-1 run return run scoreboard players set stop _ 1
scoreboard players add end_index _ 1