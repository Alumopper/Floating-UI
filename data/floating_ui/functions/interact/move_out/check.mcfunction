#> floating_ui:interact/move_out/check
# @internal

data modify entity 0-0-0-0-2 Thrower set from entity @s data.childPoint[0]
execute as 0-0-0-0-2 on origin run data modify storage floating_ui:temp arg.type set from entity @s item.tag.data.ui.type

#链式检测并传递moveOut事件
execute as 0-0-0-0-2 on origin run function floating_ui:interact/move_out/trigger with storage floating_ui:temp arg