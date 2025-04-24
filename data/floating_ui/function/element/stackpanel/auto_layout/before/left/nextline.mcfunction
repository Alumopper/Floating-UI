#左侧
scoreboard players operation @s floating_ui.child_x = @s floating_ui.size0
scoreboard players operation @s floating_ui.child_x /= 2 int
scoreboard players operation @s floating_ui.child_x *= -1 int

scoreboard players operation @s floating_ui.child_y -= @s floating_ui.stackpanel.currLineHeight
scoreboard players set @s floating_ui.stackpanel.currLineWidth 0
scoreboard players set @s floating_ui.stackpanel.currLineHeight 0