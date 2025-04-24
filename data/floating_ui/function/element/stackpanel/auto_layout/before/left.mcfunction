#换行了再调整
execute if function floating_ui:element/stackpanel/auto_layout/before/is_warp run function floating_ui:element/stackpanel/auto_layout/before/left/nextline

scoreboard players operation width _ /= 2 int
scoreboard players operation @s floating_ui.child_x += width _
scoreboard players operation height _ /= 2 int
scoreboard players operation initY _ = @s floating_ui.child_y
scoreboard players operation @s floating_ui.child_y -= height _