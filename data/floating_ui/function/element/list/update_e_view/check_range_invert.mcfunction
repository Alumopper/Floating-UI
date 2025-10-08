execute store result score start_index _ run scoreboard players operation end_index _ = @s floating_ui.list.index
scoreboard players add end_index _ 1
#倒着减，获取start_index
function floating_ui:element/list/update_e_view/check_range_invert_0
#多减了两个，start是闭区间，需要加回去
scoreboard players add start_index _ 2