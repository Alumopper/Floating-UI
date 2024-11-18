scoreboard players set @s floating_ui.visible 1
function floating_ui:element/control/_set_visible
execute if score @s floating_ui.list.childIndex = selected_index _ run scoreboard players set scale _ 100
execute unless score @s floating_ui.list.childIndex = selected_index _ run scoreboard players set scale _ 75
function floating_ui:element/control/_set_scale
