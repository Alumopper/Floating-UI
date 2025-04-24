#> floating_ui:_new_control
# 需要输入数据作为参数。
#
# 调用方式：`execute summon item_display run this with storage xxx`
# @input storage floating_ui:input temp
# @context entity @s[type=item_display/text_display]

data modify storage floating_ui:debug curr prepend value "floating_ui:_new_control"
function floating_ui:macro/new_control with storage floating_ui:input temp
data remove storage floating_ui:debug curr[0]