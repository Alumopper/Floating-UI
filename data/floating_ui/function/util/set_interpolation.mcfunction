execute if score changed floating_ui.temp matches 1 store result entity @s interpolation_duration int 1 run scoreboard players get time floating_ui.temp
execute if score changed floating_ui.temp matches 1 store result entity @s start_interpolation int 1 run scoreboard players get delay floating_ui.temp
execute unless score changed floating_ui.temp matches 1 run data remove entity @s interpolation_duration
execute unless score changed floating_ui.temp matches 1 run data remove entity @s start_interpolation 