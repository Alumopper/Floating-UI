#获取自定义控件信息
execute store result score has_custom floating_ui.temp run function floating_ui:macro/get_custom with storage floating_ui:input temp
execute if score has_custom floating_ui.temp matches 0 run return run function log:_error {msg: "custom not found"}
#遍历函数，确定参数
data modify storage floating_ui:temp params set from storage floating_ui:input temp.params
function floating_ui:element/custom/set_param/loop

#自定义数据缺省赋值
data modify storage floating_ui:temp custom_data set from storage floating_ui:temp custom.custom_data
execute if data storage floating_ui:temp custom.custom_data run function floating_ui:element/custom/set_custom_data/loop
data modify storage floating_ui:temp custom.content.custom_data set from storage floating_ui:temp temp.custom_data

#值替换
data modify storage floating_ui:input temp set from storage floating_ui:temp custom.content

#生成新控件
function floating_ui:macro/new_control with storage floating_ui:input temp

