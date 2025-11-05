execute if score @s floating_ui.list.childIndex >= start_index floating_ui.temp if score @s floating_ui.list.childIndex < end_index floating_ui.temp run return run function floating_ui:element/list/update_e_view/visible_true
scoreboard players set @s floating_ui.visible 0
function floating_ui:element/control/_set_visible