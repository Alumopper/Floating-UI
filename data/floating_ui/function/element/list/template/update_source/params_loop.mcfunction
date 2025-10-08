# floating_ui:temp temp: {template: {}, child: {value: [...], path:xxx, binds: [{source:xxx, target: xxx}]}}

#没有元素了，返回
execute unless data storage floating_ui:temp temp.child.binds[0] run return 0

# 绑定替换
function floating_ui:element/list/template/update_source/get_source with storage floating_ui:temp temp.child.binds[0]

data remove storage floating_ui:temp temp.child.binds[0]

function floating_ui:element/list/template/update_source/params_loop