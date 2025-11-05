#update the value
execute if score @s csch.ui.numberbox_group.value > @s csch.ui.numberbox_group.max run scoreboard players operation @s csch.ui.numberbox_group.value = @s csch.ui.numberbox_group.max
execute if score @s csch.ui.numberbox_group.value < @s csch.ui.numberbox_group.min run scoreboard players operation @s csch.ui.numberbox_group.value = @s csch.ui.numberbox_group.min

execute unless score @s csch.ui.numberbox_group.value = legacy_value floating_ui.temp if function ui_for_csch:control/numberbox_group/value_change run function ui_for_csch:control/numberbox_group/update_numberbox