#由于passengers是顺序，所以这里只能手动计分板索引
execute on passengers if score @s floating_ui.list.childIndex = start_index _ run scoreboard players operation content_height _ -= @s floating_ui.size1
scoreboard players remove start_index _ 1
execute if score content_height _ matches 0.. if score start_index _ matches 0.. run function floating_ui:element/list/update_e_view/check_range_invert_0