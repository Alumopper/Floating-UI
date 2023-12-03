#> floating_ui:_dispose_ui
# 清除一个UI
# @context as @s UI的根实体

execute unless entity @s[tag=floating_ui_root,type=marker] run return 0

#根实体只有一个节点
data modify entity 0-0-0-0-2 Thrower set from entity @s data.childPoint[0]
function floating_ui:dispose_control with entity @s data.floating_ui

kill @s