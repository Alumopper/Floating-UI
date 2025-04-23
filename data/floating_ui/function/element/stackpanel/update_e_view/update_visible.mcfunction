execute if score @s floating_ui.list.childIndex >= start_index _ if score @s floating_ui.list.childIndex < end_index _ run return run function floating_ui:element/list/update_e_view/visible_true
scoreboard players set @s floating_ui.visible 0
function floating_ui:element/control/_set_visible