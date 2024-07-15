#> floating_ui:_new_control
# 需要输入数据作为参数。
#
# 调用方式：`execute summon item_display run this with storage xxx`
# @input storage floating_ui:input data
# @context entity @s[type=item_display/text_display]

data modify storage floating_ui:debug curr prepend value "floating_ui:_new_control"
data modify storage floating_ui:input temp set from storage floating_ui:temp child[-1][0]
scoreboard players set #exist _ 1
$execute store success score #exist _ run function floating_ui:element/$(type)/_new with storage floating_ui:temp child[-1][0]
$execute if score #exist _ matches 0 run function floating_ui:util/_error_track {"ex":"NoSuchFunctionException","msg":"No such function: floating_ui:element/$(type)/_new"}
data remove storage floating_ui:debug curr[0]