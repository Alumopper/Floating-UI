tag @s remove floating_ui_checkingUI
execute if score @s floating_ui.uid = @p[tag=floating_ui_owner] floating_ui.uid run return run tag @s add floating_ui_checkingUI
execute if score @s floating_ui.uid matches ..-1 run tag @s add floating_ui_checkingUI