execute store result score noNewAnim _ if score isUpdate _ matches 1
function floating_ui:_new_control
scoreboard players set @s floating_ui.visible 0
function floating_ui:element/control/_set_visible
scoreboard players operation @s floating_ui.list.childIndex = temp.childCount _