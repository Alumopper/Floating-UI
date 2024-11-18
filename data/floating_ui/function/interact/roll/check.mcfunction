execute store result score slot _ run data get entity @s SelectedItemSlot
execute if score slot _ = @s floating_ui.slot run return 0
scoreboard players operation slot _ -= @s floating_ui.slot
scoreboard players operation @s floating_ui.slot += slot _

data modify entity 1bf52-0-0-0-2 Thrower set from storage floating_ui:temp floating_ui.return
execute as 1bf52-0-0-0-2 on origin on passengers run data modify storage floating_ui:temp arg.type set from entity @s item.components.minecraft:custom_data.data.ui.type

#链式检测并传递click事件
execute as 1bf52-0-0-0-2 on origin on passengers run function floating_ui:interact/roll/trigger with storage floating_ui:temp arg
