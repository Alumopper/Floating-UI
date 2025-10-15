#> floating_ui:interact/move_out/check
# @internal



data modify storage floating_ui:temp arg.type set from entity @s item.components.minecraft:custom_data.data.ui.type

#链式检测并传递moveOut事件
execute on passengers run function floating_ui:interact/move_out/trigger with storage floating_ui:temp arg
