
execute store result score curr_slot floating_ui.temp store result score slot floating_ui.temp run data get entity @s SelectedItemSlot
execute if score slot floating_ui.temp = @s floating_ui.slot run return 0
scoreboard players operation slot floating_ui.temp -= @s floating_ui.slot
execute if score @s floating_ui.slot matches 0..1 if score curr_slot floating_ui.temp matches 6..8 run scoreboard players operation slot floating_ui.temp -= 9 int
execute if score @s floating_ui.slot matches 7..8 if score curr_slot floating_ui.temp matches 0..2 run scoreboard players operation slot floating_ui.temp += 9 int
scoreboard players operation @s floating_ui.slot = curr_slot floating_ui.temp

data modify entity 1bf52-0-0-0-2 Thrower set from storage floating_ui:temp floating_ui.return
execute as 1bf52-0-0-0-2 on origin on passengers run data modify storage floating_ui:temp arg.type set from entity @s item.components.minecraft:custom_data.data.ui.type

#链式检测并传递roll事件
execute as 1bf52-0-0-0-2 on origin on passengers run function floating_ui:interact/roll/trigger with storage floating_ui:temp arg
