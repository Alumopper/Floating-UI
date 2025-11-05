execute store result score @s csch.ui.numberbox_group.value run data get entity @s item.components."minecraft:custom_data".data.custom_data.value
execute store result score @s csch.ui.numberbox_group.max run data get entity @s item.components."minecraft:custom_data".data.custom_data.max
execute store result score @s csch.ui.numberbox_group.min run data get entity @s item.components."minecraft:custom_data".data.custom_data.min
function ui_for_csch:control/numberbox_group/update_numberbox