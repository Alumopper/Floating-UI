#> floating_ui:interact/click/check
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:interact/click/check"
#判断是那个按下
execute if entity @s[advancements={floating_ui:left_click=true}] run scoreboard players set click_status _ 1
advancement revoke @s[advancements={floating_ui:left_click=true}] only floating_ui:left_click
execute if entity @s[advancements={floating_ui:right_click=true}] run scoreboard players set click_status _ -1
advancement revoke @s[advancements={floating_ui:right_click=true}] only floating_ui:right_click

data modify entity 1bf52-0-0-0-2 Thrower set from storage floating_ui:temp floating_ui.return
execute as 1bf52-0-0-0-2 on origin run data modify entity 1bf52-0-0-0-2 Thrower set from entity @s data.childPoint[0]
execute as 1bf52-0-0-0-2 on origin run data modify storage floating_ui:temp arg.type set from entity @s item.tag.data.ui.type

#链式检测并传递click事件
execute as 1bf52-0-0-0-2 on origin run function floating_ui:interact/click/trigger with storage floating_ui:temp arg
data remove storage floating_ui:debug curr[0]

