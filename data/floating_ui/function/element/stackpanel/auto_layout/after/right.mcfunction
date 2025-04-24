execute if score @s floating_ui.stackpanel.currLineHeight < height _ run scoreboard players operation @s floating_ui.stackpanel.currLineHeight = height _
scoreboard players operation @s floating_ui.stackpanel.currLineWidth += width _
scoreboard players operation width _ /= 2 int
scoreboard players operation @s floating_ui.child_x -= width _
scoreboard players operation @s floating_ui.child_y = initY _