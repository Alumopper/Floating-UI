#> floating_ui:_player_new_ui
# 以某个玩家为拥有者创建一个ui面板
# @context as @s 单个玩家
# @input storage floating_ui:input data ui布局数据

tag @s add floating_ui_owner
execute anchored eyes positioned ^ ^ ^4 facing entity @s eyes summon marker run function floating_ui:_new_ui with storage floating_ui:input data
tag @s remove floating_ui_owner