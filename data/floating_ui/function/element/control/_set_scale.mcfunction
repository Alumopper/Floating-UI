#@input score scale _
execute store result entity @s item.components.minecraft:custom_data.data.scale float 0.01 run scoreboard players get scale _

#设置自己的大小(x10000)
scoreboard players operation temp.size0 _ = @s floating_ui.size0_without_scale
scoreboard players operation temp.size1 _ = @s floating_ui.size1_without_scale
execute store result score @s floating_ui.size0 run scoreboard players operation temp.size0 _ *= scale _
execute store result score @s floating_ui.size1 run scoreboard players operation temp.size1 _ *= scale _
scoreboard players operation @s floating_ui.size0 /= 100 int
scoreboard players operation @s floating_ui.size1 /= 100 int
execute store result entity @s transformation.scale[0] float 0.000001 run scoreboard players get temp.size0 _
execute store result entity @s transformation.scale[1] float 0.000001 run scoreboard players get temp.size0 _

#设置子控件的缩放
execute on passengers run function floating_ui:element/control/set_scale/set_scale_by_parent