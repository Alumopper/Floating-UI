#> floating_ui:element/sprite/_dispose
# @internal


execute on passengers run function floating_ui:dispose_control with entity @s item.components.minecraft:custom_data.data.ui


# Delete the control itself
kill @s
