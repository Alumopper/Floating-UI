scoreboard players operation end_index _ = @s floating_ui.list.index
scoreboard players add end_index _ 1
execute on passengers if score @s floating_ui.list.childIndex >= start_index _ if score @s floating_ui.list.childIndex < end_index _ run scoreboard players operation content_height _ -= @s floating_ui.size1
#从头开始加回去
execute on passengers if score stop _ matches 0 if score content_height _ matches ..-1 run function floating_ui:element/list/update_e_view/check_range_invert_0