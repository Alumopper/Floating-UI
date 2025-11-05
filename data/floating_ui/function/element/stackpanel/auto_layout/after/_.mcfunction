execute store result score height floating_ui.temp run data get storage floating_ui:input temp.size[1] 10000
execute store result score width floating_ui.temp run data get storage floating_ui:input temp.size[0] 10000
execute if score @s floating_ui.stackpanel.align = LEFT floating_ui.stackpanel.align run return run function floating_ui:element/stackpanel/auto_layout/after/left
execute if score @s floating_ui.stackpanel.align = CENTER floating_ui.stackpanel.align run return run function floating_ui:element/stackpanel/auto_layout/after/center
function floating_ui:element/stackpanel/auto_layout/after/right