#获取自定义控件信息
function floating_ui:macro/get_custom with storage floating_ui:input temp
#遍历函数，确定参数
data modify storage floating_ui:temp params set from storage floating_ui:input temp.params
function floating_ui:element/custom/set_param/loop
#值替换
data modify storage floating_ui:input temp set from storage floating_ui:temp custom.content
#生成新控件
function floating_ui:macro/new_control with storage floating_ui:input temp