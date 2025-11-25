# unless you know what you're doing, don't override this function

function floating_ui:element/control/animation/new

execute on passengers if entity @s[type=item_display] run function floating_ui:macro/animation/new with entity @s item.components."minecraft:custom_data".data.ui