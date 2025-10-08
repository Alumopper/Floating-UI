#注册绑定
data modify storage floating_ui:temp binding.path set from storage floating_ui:input temp.child.path
function floating_ui:datasource/register_binding
#在实体中写入绑定信息
function floating_ui:element/stackpanel/template/register_binding_1 with storage floating_ui:input temp.child
return 1