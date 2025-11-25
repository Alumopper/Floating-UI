execute store result entity @s item.components.minecraft:custom_data.data.scale float 0.01 run scoreboard players get scale floating_ui.temp

#设置自己的大小(x10000)
scoreboard players operation temp.size0 floating_ui.temp = @s floating_ui.size0_without_scale
scoreboard players operation temp.size1 floating_ui.temp = @s floating_ui.size1_without_scale
execute store result score @s floating_ui.size0 run scoreboard players operation temp.size0 floating_ui.temp *= scale floating_ui.temp
execute store result score @s floating_ui.size1 run scoreboard players operation temp.size1 floating_ui.temp *= scale floating_ui.temp
scoreboard players operation @s floating_ui.size0 /= 100 int
scoreboard players operation @s floating_ui.size1 /= 100 int
execute store result entity @s interpolation_duration int 1 run scoreboard players get time floating_ui.temp
execute store result entity @s start_interpolation int 1 run scoreboard players get time floating_ui.temp
execute store result entity @s transformation.scale[0] float 0.000001 run scoreboard players get temp.size0 floating_ui.temp
execute store result entity @s transformation.scale[1] float 0.000001 run scoreboard players get temp.size0 floating_ui.temp

#设置子控件的缩放
execute on passengers run function floating_ui:element/control/set_scale/set_scale_by_parent