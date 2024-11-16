function floating_ui:_new_control with storage floating_ui:temp child[-1][0]
scoreboard players set @s floating_ui.visible 0
function floating_ui:element/control/_set_visible
scoreboard players operation @s floating_ui.list.childIndex = temp.childCound _