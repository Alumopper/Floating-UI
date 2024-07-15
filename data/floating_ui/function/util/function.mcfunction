#> floating_ui:util/function
# @with function 函数名

data modify storage floating_ui:debug curr prepend value "floating_ui:util/function"
$function $(function)
data remove storage floating_ui:debug curr[0]