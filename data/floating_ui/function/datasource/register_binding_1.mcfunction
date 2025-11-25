#这个控件有数据绑定
scoreboard players set @s floating_ui.data_id 0
execute unless score @s floating_ui.data_id_0 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_0 = floating_ui.temp int
execute unless score @s floating_ui.data_id_1 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_1 = floating_ui.temp int
execute unless score @s floating_ui.data_id_2 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_2 = floating_ui.temp int
execute unless score @s floating_ui.data_id_3 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_3 = floating_ui.temp int
execute unless score @s floating_ui.data_id_4 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_4 = floating_ui.temp int
execute unless score @s floating_ui.data_id_5 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_5 = floating_ui.temp int
execute unless score @s floating_ui.data_id_6 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_6 = floating_ui.temp int
execute unless score @s floating_ui.data_id_7 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_7 = floating_ui.temp int
execute unless score @s floating_ui.data_id_8 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_8 = floating_ui.temp int
execute unless score @s floating_ui.data_id_9 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_9 = floating_ui.temp int
execute unless score @s floating_ui.data_id_10 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_10 = floating_ui.temp int
execute unless score @s floating_ui.data_id_11 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_11 = floating_ui.temp int
execute unless score @s floating_ui.data_id_12 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_12 = floating_ui.temp int
execute unless score @s floating_ui.data_id_13 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_13 = floating_ui.temp int
execute unless score @s floating_ui.data_id_14 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_14 = floating_ui.temp int
execute unless score @s floating_ui.data_id_15 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_15 = floating_ui.temp int
execute unless score @s floating_ui.data_id_16 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_16 = floating_ui.temp int
execute unless score @s floating_ui.data_id_17 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_17 = floating_ui.temp int
execute unless score @s floating_ui.data_id_18 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_18 = floating_ui.temp int
execute unless score @s floating_ui.data_id_19 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_19 = floating_ui.temp int
execute unless score @s floating_ui.data_id_20 matches -2147483648..2147483647 run return run scoreboard players operation @s floating_ui.data_id_20 = floating_ui.temp int
function log:_error {msg: "Failed to register binding: No data_id is available"}
#绑定失败，移除绑定标记
scoreboard players reset @s floating_ui.data_id