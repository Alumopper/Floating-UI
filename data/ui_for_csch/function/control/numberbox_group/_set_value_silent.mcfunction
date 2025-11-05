
execute unless score value floating_ui.temp matches -2147483648..2147483647 run return fail

#update the value
scoreboard players operation legacy_value floating_ui.temp = @s csch.ui.numberbox_group.value
scoreboard players operation @s csch.ui.numberbox_group.value = value floating_ui.temp
execute if score @s csch.ui.numberbox_group.value > @s csch.ui.numberbox_group.max run scoreboard players operation @s csch.ui.numberbox_group.value = @s csch.ui.numberbox_group.max
execute if score @s csch.ui.numberbox_group.value < @s csch.ui.numberbox_group.min run scoreboard players operation @s csch.ui.numberbox_group.value = @s csch.ui.numberbox_group.min

execute unless score @s csch.ui.numberbox_group.value = legacy_value floating_ui.temp run function ui_for_csch:control/numberbox_group/update_numberbox