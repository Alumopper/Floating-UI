execute if entity @s[tag=floating_ui_textcontrol] run function floating_ui:element/textcontrol/set_scale/set_offset_with_scale
execute unless entity @s[tag=floating_ui_textcontrol] run function floating_ui:element/control/set_scale/set_offset_with_scale
# 考虑子控件自身的缩放倍率
execute if entity @s[tag=floating_ui_textblock] run return run function floating_ui:element/textblock/_set_scale
function floating_ui:element/control/set_scale/do