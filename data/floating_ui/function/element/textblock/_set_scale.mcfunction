#@input score scale floating_ui.temp
execute store result entity @s item.components.minecraft:custom_data.data.scale float 0.01 run scoreboard players get scale floating_ui.temp

#设置自己的大小(x10000)
scoreboard players operation temp.size0 floating_ui.temp = @s floating_ui.size0_without_scale
scoreboard players operation temp.size1 floating_ui.temp = @s floating_ui.size1_without_scale
execute store result score @s floating_ui.size0 run scoreboard players operation temp.size0 floating_ui.temp *= scale floating_ui.temp
execute store result score @s floating_ui.size1 run scoreboard players operation temp.size1 floating_ui.temp *= scale floating_ui.temp
scoreboard players operation @s floating_ui.size0 /= 100 int
scoreboard players operation @s floating_ui.size1 /= 100 int

#set text display's scale

scoreboard players operation f floating_ui.temp = @s floating_ui.text.fontsize
scoreboard players operation f floating_ui.temp *= scale floating_ui.temp

data modify storage floating_ui:temp transformation.scale set value [0f, 0f, 0f]
execute store result storage floating_ui:temp transformation.scale[0] float 0.000001 run scoreboard players get f floating_ui.temp
execute store result storage floating_ui:temp transformation.scale[1] float 0.000001 run scoreboard players get f floating_ui.temp

scoreboard players set changed floating_ui.temp 0
execute on passengers store success score changed floating_ui.temp run data modify entity @s transformation.scale set from storage floating_ui:temp transformation.scale

execute on passengers run function floating_ui:util/set_interpolation

# 注意，文本展示实体的位置和大小有关，需要重新指定相对位置
scoreboard players operation text_y floating_ui.temp = @s floating_ui.size1
scoreboard players operation text_y floating_ui.temp /= 2 int
scoreboard players operation root_y floating_ui.temp = @s floating_ui.root_y
execute on passengers store result entity @s transformation.translation[1] float 0.0001 run scoreboard players operation root_y floating_ui.temp -= text_y floating_ui.temp