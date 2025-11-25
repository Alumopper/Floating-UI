scoreboard players operation content_height floating_ui.temp = @s floating_ui.size1 
scoreboard players set count floating_ui.temp 0
scoreboard players set stop floating_ui.temp 0
execute if score @s floating_ui.list.index < @s floating_ui.list.minIndex run scoreboard players operation @s floating_ui.list.minIndex = @s floating_ui.list.index 
scoreboard players operation start_index floating_ui.temp = @s floating_ui.list.minIndex
scoreboard players operation end_index floating_ui.temp = @s floating_ui.list.minIndex
#确认要显示的元素的索引范围
execute if score @s floating_ui.list.maxIndex > @s floating_ui.list.index on passengers if score stop floating_ui.temp matches 0 if score @s floating_ui.list.childIndex >= start_index floating_ui.temp run function floating_ui:element/list/update_e_view/check_range
execute if score @s floating_ui.list.maxIndex <= @s floating_ui.list.index run function floating_ui:element/list/update_e_view/check_range_invert

scoreboard players operation @s floating_ui.list.minIndex = start_index floating_ui.temp
scoreboard players operation @s floating_ui.list.maxIndex = end_index floating_ui.temp

scoreboard players operation @s floating_ui.child_y = @s floating_ui.size1
scoreboard players operation @s floating_ui.child_y /= 2 int 

# 遍历子元素
scoreboard players operation content_height floating_ui.temp = @s floating_ui.size1
scoreboard players operation content_height floating_ui.temp /= 2 int
execute on passengers if score @s floating_ui.list.childIndex >= start_index floating_ui.temp if score @s floating_ui.list.childIndex < end_index floating_ui.temp run function floating_ui:element/list/update_e_view/update_child

# 更新子元素可视状态
scoreboard players operation selected_index floating_ui.temp = @s floating_ui.list.index
execute on passengers run function floating_ui:element/list/update_e_view/update_visible
