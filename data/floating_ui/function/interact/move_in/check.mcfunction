#> floating_ui:interact/move_in/check
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:interact/move_in/check"

# 选中根实体
data modify entity 1bf52-0-0-0-2 Thrower set from storage floating_ui:temp floating_ui.return

#之前是否被观察
scoreboard players set isLookedAt _ 0
execute as 1bf52-0-0-0-2 on origin if entity @s[tag=floating_ui_legacy_lookedAt] run scoreboard players set isLookedAt _ 1

#现在正在被观察
execute as 1bf52-0-0-0-2 on origin run tag @s add floating_ui_lookedAt
execute as 1bf52-0-0-0-2 on origin on passengers run data modify storage floating_ui:temp arg.type set from entity @s item.components.minecraft:custom_data.data.ui.type

#之前在被观察，现在也在被观察，说明是指针在ui上移动，没有离开
execute if score isLookedAt _ matches 1 as 1bf52-0-0-0-2 on origin on passengers run function floating_ui:interact/move/trigger with storage floating_ui:temp arg 
execute if score isLookedAt _ matches 1 run data remove storage floating_ui:debug curr[0]
execute if score isLookedAt _ matches 1 run return 0

#是进入事件，链式检测并传递moveIn事件
execute as 1bf52-0-0-0-2 on origin on passengers run function floating_ui:interact/move_in/trigger with storage floating_ui:temp arg
data remove storage floating_ui:debug curr[0]