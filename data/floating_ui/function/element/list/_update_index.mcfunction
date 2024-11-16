# Update the index of the list element
execute if score @s floating_ui.list.index >= @s floating_ui.list.childCount run scoreboard players operation @s floating_ui.list.index = @s floating_ui.list.childCount
