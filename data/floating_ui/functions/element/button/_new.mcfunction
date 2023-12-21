#> floating_ui:element/button/_new
# 创建一个新的button。
#
# @input storage floating_ui:input 要创建的ui的内容信息

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/_new"
function floating_ui:element/control/_new

tag @s add floating_ui_button

#点击事件
#execute unless data storage floating_ui:input temp.click run function log:_warn {msg:"按钮没有设置点击事件"}
execute if data storage floating_ui:input temp.click run data modify entity @s item.tag.data.click set from storage floating_ui:input temp.click
data remove storage floating_ui:debug curr[0]