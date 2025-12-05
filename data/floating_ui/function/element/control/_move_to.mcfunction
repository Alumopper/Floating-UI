#> floating_ui:element/control/_move_to
# 将这个控件及其子控件移动到指定的位置
# @api
# @input floating_ui:input temp [float x,float y]
# @input score time floating_ui.temp (optional)
# @input score delay floating_ui.temp (optional)


function floating_ui:element/control/set_offset/do

#移动子节点
execute on passengers run function floating_ui:element/control/move_to/text_or_control

scoreboard players reset time floating_ui.temp
scoreboard players reset delay floating_ui.temp