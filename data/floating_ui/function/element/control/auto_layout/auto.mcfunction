#@input storage floating_ui:temp child[-1][0]
#@context 控件自己

data modify storage floating_ui:debug curr prepend value "floating_ui:element/control/auto_layout/auto"

#坐标控制。默认居中不移动
execute unless data storage floating_ui:temp child[-1][0].x run data modify storage floating_ui:temp child[-1][0].x set value 0
execute unless data storage floating_ui:temp child[-1][0].y run data modify storage floating_ui:temp child[-1][0].y set value 0
#大小控制。默认不超出父控件
execute unless data storage floating_ui:temp child[-1][0].size run function floating_ui:element/control/auto_layout/get_child_size

data remove storage floating_ui:debug curr[0]