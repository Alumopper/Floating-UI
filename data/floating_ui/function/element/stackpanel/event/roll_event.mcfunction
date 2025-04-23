#> floating_ui:element/list/event/roll
# @internal

#say roll

data modify storage floating_ui:debug curr prepend value "floating_ui:element/list/event/roll"

scoreboard players operation @s floating_ui.list.index += slot _
execute if score @s floating_ui.list.index >= @s floating_ui.list.childCount run scoreboard players operation @s floating_ui.list.index = @s floating_ui.list.childCount
execute if score @s floating_ui.list.index = @s floating_ui.list.childCount run scoreboard players remove @s floating_ui.list.index 1
execute if score @s floating_ui.list.index matches ..-1 run scoreboard players set @s floating_ui.list.index 0 

function floating_ui:element/list/update_e_view

data remove storage floating_ui:debug curr[0]