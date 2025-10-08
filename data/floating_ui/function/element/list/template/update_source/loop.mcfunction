#没有元素了，返回
execute unless data storage floating_ui:temp temp.child.value[0] run return 0

#复制一份模板
data modify storage floating_ui:temp temp.template set from storage floating_ui:input temp.template
#复制绑定参数表
data modify storage floating_ui:temp temp.child.binds set from storage floating_ui:input temp.child.binds

# 绑定替换
function floating_ui:element/list/template/update_source/params_loop

# 得到了模板，加入child列表
data modify storage floating_ui:input temp.child.data append from storage floating_ui:temp temp.template

data remove storage floating_ui:temp temp.child.value[0]

function floating_ui:element/list/template/update_source/loop