# floating_ui:temp binding
# {path: ''}
# 使用宏对数据进行编号，并返回编号

execute store result score _ int run function floating_ui:datasource/get_or_create_data_id with storage floating_ui:temp binding
#设置实体绑定
function floating_ui:datasource/register_binding_1