execute if score @s floating_ui.stackpanel.currLineHeight < height floating_ui.temp run scoreboard players operation @s floating_ui.stackpanel.currLineHeight = height floating_ui.temp
scoreboard players operation @s floating_ui.stackpanel.currLineWidth += width floating_ui.temp
scoreboard players operation width floating_ui.temp /= 2 int
scoreboard players operation @s floating_ui.child_x -= width floating_ui.temp
scoreboard players operation @s floating_ui.child_y = initY floating_ui.temp