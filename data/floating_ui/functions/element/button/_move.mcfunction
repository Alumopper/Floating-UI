#> floating_ui:element/button/_move
# @api

function floating_ui:element/control/_move

data modify entity 0-0-0-0-2 Thrower set from entity @s item.tag.data.childPoint[0]
function floating_ui:macro/move_control with entity @s item.tag.data.ui.content
