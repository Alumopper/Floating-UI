execute if function floating_ui:element/stackpanel/auto_layout/before/is_warp run function floating_ui:element/stackpanel/auto_layout/before/right/nextline
scoreboard players operation width floating_ui.temp /= 2 int
scoreboard players operation @s floating_ui.child_x -= width floating_ui.temp
scoreboard players operation initY floating_ui.temp = @s floating_ui.child_y
scoreboard players operation height floating_ui.temp /= 2 int
scoreboard players operation @s floating_ui.child_y -= height floating_ui.temp