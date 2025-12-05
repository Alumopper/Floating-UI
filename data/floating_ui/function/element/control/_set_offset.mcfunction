#> floating_ui:element/control/_set_offset
# 设置这个控件的偏移
# @api
# @input floating_ui:input temp [float x,float y, float z]
# @input score time floating_ui.temp (optional)
# @input score delay floating_ui.temp (optional)

function floating_ui:element/control/set_offset/do

scoreboard players reset time floating_ui.temp
scoreboard players reset delay floating_ui.temp