#update group value
execute on passengers if entity @s[tag=2] run scoreboard players operation num2 floating_ui.temp = @s floating_ui.numberbox.value
execute on passengers if entity @s[tag=1] run scoreboard players operation num1 floating_ui.temp = @s floating_ui.numberbox.value
execute on passengers if entity @s[tag=0] run scoreboard players operation num0 floating_ui.temp = @s floating_ui.numberbox.value
execute store result score @s csch.ui.numberbox_group.value run scoreboard players operation num2 floating_ui.temp *= 100 int
scoreboard players operation num1 floating_ui.temp *= 10 int
scoreboard players operation @s csch.ui.numberbox_group.value += num1 floating_ui.temp
scoreboard players operation @s csch.ui.numberbox_group.value += num0 floating_ui.temp

scoreboard players set not_in_range floating_ui.temp 0
execute \
    store result score not_in_range floating_ui.temp \
    if score @s csch.ui.numberbox_group.value > @s csch.ui.numberbox_group.max \
    run scoreboard players operation @s csch.ui.numberbox_group.value = @s csch.ui.numberbox_group.max
execute \
    if score not_in_range floating_ui.temp matches 0 \
    store result score not_in_range floating_ui.temp \
    if score @s csch.ui.numberbox_group.value < @s csch.ui.numberbox_group.min \
    run scoreboard players operation @s csch.ui.numberbox_group.value = @s csch.ui.numberbox_group.min 
execute if score not_in_range floating_ui.temp matches 1 run function ui_for_csch:control/numberbox_group/update_numberbox

data modify storage floating_ui:temp arg.function set from entity @s item.components.minecraft:custom_data.data.custom_data.value_change
function floating_ui:util/function