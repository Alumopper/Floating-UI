#> floating_ui:_new_control
# 需要输入数据作为参数。
#
# 调用方式：`execute summon marker run this with storage xxx`
# @input storage floating_ui:input data
# @context entity @s[type=item_display/text_display]

data modify storage floating_ui:debug curr prepend value "floating_ui:_new_control"
#tellraw @a {"nbt":"child[-1][0]","storage":"floating_ui:temp"}
data modify storage floating_ui:input temp set from storage floating_ui:temp child[-1][0]
$function floating_ui:element/$(type)/_new with storage floating_ui:temp child[-1][0]
data remove storage floating_ui:debug curr[0]