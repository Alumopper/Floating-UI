# floating_ui:input temp.child: {value: [...], path:xxx, binds: [{source:xxx, target: xxx}],data:[]}

#tellraw @a {"storage": "floating_ui:input", "nbt": "temp.child"}
#遍历函数，确定参数
data modify storage floating_ui:temp temp.child.value set from storage floating_ui:input temp.child.value
execute unless data storage floating_ui:temp temp.child.value[0] run return run function log:_error {"message":"Data source must be a list"}

#覆盖手动定义的子元素
data modify storage floating_ui:input temp.child.data set value []

function floating_ui:element/list/template/update_source/loop

#子元素
function floating_ui:element/list/child