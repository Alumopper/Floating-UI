tag @s add temp
execute on passengers run scoreboard players operation @s floating_ui.visible = @n[tag=temp, distance=..1] floating_ui.visible
tag @s remove temp
function floating_ui:element/control/change_visible
execute on passengers run function floating_ui:element/control/_set_visible