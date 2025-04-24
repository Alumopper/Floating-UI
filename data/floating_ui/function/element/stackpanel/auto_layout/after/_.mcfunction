execute store result score height _ run data get storage floating_ui:input temp.size[1] 10000
execute store result score width _ run data get storage floating_ui:input temp.size[0] 10000
execute if score @s floating_ui.stackpanel.align matches 0 run return run function floating_ui:element/stackpanel/auto_layout/after/left
execute if score @s floating_ui.stackpanel.align matches 1 run return run function floating_ui:element/stackpanel/auto_layout/after/center
function floating_ui:element/stackpanel/auto_layout/after/right