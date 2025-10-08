# floating_ui:input temp.child: {value: [...], path:xxx, binds: [{child:xxx, target: xxx}]}

#tellraw @a {"storage": "floating_ui:input", "nbt": "temp.child"}

#遍历函数，确定参数
data modify storage floating_ui:temp temp.child.value set from storage floating_ui:input temp.child.value
execute unless data storage floating_ui:temp temp.child.value[0] run return run function log:_error {"message":"Data source must be a list"}

data modify storage floating_ui:input temp.child.data set value []

function floating_ui:element/stackpanel/template/update_source/loop

#子元素
function floating_ui:element/stackpanel/child