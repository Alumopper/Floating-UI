#> floating_ui:_new_control
# 需要输入数据作为参数。
#
# 调用方式：`execute summon item_display run this with storage xxx`
# @input storage floating_ui:input temp
# @context entity @s[type=item_display/text_display]

data modify storage floating_ui:debug curr prepend value "floating_ui:_new_control"
execute unless score noNewAnim _ matches -2147483648..2147483647 run scoreboard players set noNewAnim _ 0
function floating_ui:macro/new_control with storage floating_ui:input temp
scoreboard players set noNewAnim _ 0
data remove storage floating_ui:debug curr[0]