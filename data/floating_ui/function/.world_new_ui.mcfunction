#> floating_ui:.world_new_ui
# 以某个玩家为拥有者创建一个ui面板
# @input storage floating_ui:input data ui布局数据


execute store result score check _ run function floating_ui:util/check/world_entity
execute if score check _ matches 0 run return fail
execute anchored eyes positioned ^ ^ ^4 facing entity @s eyes summon item_display run function floating_ui:_new_ui
