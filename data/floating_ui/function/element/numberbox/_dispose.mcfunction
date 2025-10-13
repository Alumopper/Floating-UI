#> floating_ui:element/sprite/_dispose
# @internal
data modify storage floating_ui:debug curr prepend value "floating_ui:element/sprite/_dispose"

execute on passengers run function floating_ui:dispose_control with entity @s item.components.minecraft:custom_data.data.ui


# Delete the control itself
kill @s
data remove storage floating_ui:debug curr[0]