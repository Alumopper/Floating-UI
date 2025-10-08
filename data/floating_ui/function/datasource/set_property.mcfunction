# floating_ui:temp binding
# {path: xxx, value: xxx}
execute store result score _ int run function floating_ui:datasource/get_or_create_data_id with storage floating_ui:temp binding
#设置值
function floating_ui:datasource/set_value with storage floating_ui:temp binding
execute if score isChanged _ matches 0 run return 0
#通知所有UI刷新
scoreboard players operation now floating_ui.notify_id = SOURCE_UPDATE floating_ui.notify_id
execute as @e[tag=floating_ui_control] run function floating_ui:datasource/set_property_1