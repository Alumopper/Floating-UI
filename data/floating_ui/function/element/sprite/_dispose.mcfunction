#> floating_ui:element/sprite/_dispose
# @internal
data modify storage floating_ui:debug curr prepend value "floating_ui:element/sprite/_dispose"
#删除自己
kill @s
data remove storage floating_ui:debug curr[0]