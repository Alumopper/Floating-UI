#> floating_ui:interact/move_in/check
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:interact/move_in/check"
data modify entity 0-0-0-0-2 Thrower set from storage floating_ui:temp floating_ui.return
scoreboard players set isLookedAt _ 0
#之前是否被观察
execute as 0-0-0-0-2 on origin if entity @s[tag=floating_ui_legacy_lookedAt] run scoreboard players set isLookedAt _ 1
#现在正在被观察
execute as 0-0-0-0-2 on origin run tag @s add floating_ui_lookedAt

execute as 0-0-0-0-2 on origin run data modify entity 0-0-0-0-2 Thrower set from entity @s data.childPoint[0]
execute as 0-0-0-0-2 on origin run data modify storage floating_ui:temp arg.type set from entity @s item.tag.data.ui.type

execute if score isLookedAt _ matches 1 as 0-0-0-0-2 on origin run function floating_ui:interact/move/trigger with storage floating_ui:temp arg 
execute if score isLookedAt _ matches 1 run data remove storage floating_ui:debug curr[0]
execute if score isLookedAt _ matches 1 run return 0
#链式检测并传递moveIn事件
execute as 0-0-0-0-2 on origin run function floating_ui:interact/move_in/trigger with storage floating_ui:temp arg
data remove storage floating_ui:debug curr[0]