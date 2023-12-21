#> floating_ui:element/textblock/_new
# 创建一个新的textblock。
#
# @input storage floating_ui:input 要创建的ui的内容信息

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textblock/_new"
function floating_ui:element/textcontrol/_new

tag @s add floating_ui_textblock

execute as 0-0-0-0-4 on origin run function floating_ui:element/textblock/set_text_display

data remove storage floating_ui:debug curr[0]