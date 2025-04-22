#> floating_ui:_player_new_ui
# 以某个玩家为拥有者创建一个ui面板
# @context as @s 单个玩家
# @input storage floating_ui:input data ui布局数据

data modify storage floating_ui:debug curr prepend value "floating_ui:player_new_ui"
execute store result score check _ run function floating_ui:util/check/world_entity
execute if score check _ matches 0 run data remove storage floating_ui:debug curr[0]
execute if score check _ matches 0 run return fail
tag @s add floating_ui_owner
execute anchored eyes positioned ^ ^ ^4 facing entity @s eyes summon item_display run function floating_ui:_new_ui
tag @s remove floating_ui_owner
data remove storage floating_ui:debug curr[0]