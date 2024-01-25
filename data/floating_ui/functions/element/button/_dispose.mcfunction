#> floating_ui:element/button/_dispose

data modify entity 1bf52-0-0-0-2 Thrower set from entity @s item.tag.data.childPoint[0]
function floating_ui:dispose_control with entity @s item.tag.data.ui.content

kill @s