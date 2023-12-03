#> floating_ui:element/panel/add_child
# 添加子元素
# @within floating_ui:element/panel/_new

execute store result score length _ run data get storage floating_ui:temp child[-1]
execute if score length _ matches 0 run return 1
execute summon item_display run function floating_ui:_new_control with storage floating_ui:temp child[-1][-1]
data remove storage floating_ui:temp child[-1][-1]
execute positioned ^ ^ ^0.001 run function floating_ui:element/panel/add_child