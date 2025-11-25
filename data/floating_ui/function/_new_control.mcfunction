#> floating_ui:_new_control
# 需要输入数据作为参数。
#
# 调用方式：`execute summon item_display run this with storage xxx`
# @input storage floating_ui:input temp
# @context entity @s[type=item_display/text_display]


execute unless score noNewAnim floating_ui.temp matches -2147483648..2147483647 run scoreboard players set noNewAnim floating_ui.temp 0
function floating_ui:macro/new_control with storage floating_ui:input temp
scoreboard players set noNewAnim floating_ui.temp 0
