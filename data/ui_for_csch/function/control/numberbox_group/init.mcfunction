execute store result score @s csch.ui.numberbox_group.value run data get entity @s item.components."minecraft:custom_data".data.custom_data.value
execute store result score @s csch.ui.numberbox_group.max run data get entity @s item.components."minecraft:custom_data".data.custom_data.max
execute store result score @s csch.ui.numberbox_group.min run data get entity @s item.components."minecraft:custom_data".data.custom_data.min

execute store result score enabled floating_ui.temp store result score @s floating_ui.enabled run data get entity @s item.components."minecraft:custom_data".data.custom_data.enabled
execute on passengers run scoreboard players operation @s floating_ui.enabled = enabled floating_ui.temp

data modify entity @s Tags append from entity @s item.components."minecraft:custom_data".data.custom_data.tag

function ui_for_csch:control/numberbox_group/update_numberbox

execute if data entity @s item.components."minecraft:custom_data".data.custom_data.scale run function ui_for_csch:control/numberbox_group/init/set_scale
