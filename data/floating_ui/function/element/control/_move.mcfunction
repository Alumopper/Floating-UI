#> floating_ui:element/control/_move
# 将这个控件及其子控件移动相应的距离
# @api
# @input floating_ui:input move [float x,float y]



function floating_ui:element/control/move
#移动子节点
execute on passengers run function floating_ui:element/control/_move

