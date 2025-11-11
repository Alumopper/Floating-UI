#获取自定义控件信息
data remove storage floating_ui:temp custom

#floating_ui:input temp储存了模板的实例布局信息
#floating_ui:temp custom储存了模板的布局信息
execute store result score has_custom floating_ui.temp run function floating_ui:macro/get_custom with storage floating_ui:input temp
execute if score has_custom floating_ui.temp matches 0 run return run function log:_error {msg: "custom not found"}

#遍历函数，替换参数
function floating_ui:element/custom/set_param/loop

#自定义数据缺省赋值
#获取有哪些自定义数据
data modify storage floating_ui:temp custom_data set from storage floating_ui:temp custom.custom_data

#遍历自定义数据，找到实例中有哪些自定义数据存在缺省值且没有被赋值，则自动赋值缺省值
execute if data storage floating_ui:temp custom.custom_data run function floating_ui:element/custom/set_custom_data/loop

#Control控件共同数据
function floating_ui:element/custom/set_param/common

#值替换
data modify storage floating_ui:input temp set from storage floating_ui:temp custom.content

#生成新控件
function floating_ui:macro/new_control with storage floating_ui:input temp

