execute store result score scale floating_ui.temp run data get entity @s item.components."minecraft:custom_data".data.custom_data.scale 100
scoreboard players set time floating_ui.temp 3
function floating_ui:element/control/_set_scale