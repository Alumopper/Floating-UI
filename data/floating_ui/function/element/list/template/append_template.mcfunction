# template: (string|compound)
# 如果不是内联数据，则获取数据模板
execute unless data storage floating_ui:input temp.template.type unless function floating_ui:element/list/template/try_get_template run return run function log:_error {msg: "获取数据模板失败！"}
# temp.child: {value: [...], path:xxx, binds: [source:xxx, target: xxx]}
# 若有绑定，则注册绑定，并获取绑定数据，储存在source.value中。如果没有binding，则说明直接声明了数据源，不参与绑定
execute if data storage floating_ui:input temp.child.path if function floating_ui:element/list/template/register_binding run function floating_ui:element/list/template/set_source with storage floating_ui:temp binding
# 解析保存在temp.child.value中的源数据
function floating_ui:element/list/template/update_source