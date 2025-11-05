#@input storage floating_ui:temp child[-1][0]
#@context 控件自己

#自动坐标控制。默认居中不移动
execute unless data storage floating_ui:temp child[-1][0].x run data modify storage floating_ui:temp child[-1][0].x set value 0
execute unless data storage floating_ui:temp child[-1][0].y run data modify storage floating_ui:temp child[-1][0].y set value 0
#自动大小控制。默认不超出父控件
data modify storage floating_ui:temp args.key set from storage floating_ui:temp child[-1][0].type
function floating_ui:util/tag/is_container with storage floating_ui:temp args
execute if score return floating_ui.temp matches 1 unless data storage floating_ui:temp child[-1][0].size run function floating_ui:element/control/auto_layout/get_child_size