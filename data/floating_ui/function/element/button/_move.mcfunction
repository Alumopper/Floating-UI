#> floating_ui:element/button/_move
# @api

function floating_ui:element/control/_move

execute on passengers run data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID
function floating_ui:macro/move_control with entity @s item.components.minecraft:custom_data.data.ui.content
