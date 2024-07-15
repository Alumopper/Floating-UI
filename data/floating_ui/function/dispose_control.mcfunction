#> floating_ui:dispose_control
# @with type 控件的种类
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:dispose_control"
$function floating_ui:element/$(type)/_dispose
data remove storage floating_ui:debug curr[0]