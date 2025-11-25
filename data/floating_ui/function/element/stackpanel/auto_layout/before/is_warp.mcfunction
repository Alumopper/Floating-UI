scoreboard players operation nextWidth floating_ui.temp = width floating_ui.temp
scoreboard players operation nextWidth floating_ui.temp += @s floating_ui.stackpanel.currLineWidth
return run execute if score nextWidth floating_ui.temp > @s floating_ui.size0