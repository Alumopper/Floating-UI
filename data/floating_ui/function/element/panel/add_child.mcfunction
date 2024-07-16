#> floating_ui:element/panel/add_child
# 添加子元素
# @within floating_ui:element/panel/_new

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/add_child"
#父节点替换
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID

execute store result score length _ run data get storage floating_ui:temp child[-1]
execute if score length _ matches 0 run data remove storage floating_ui:debug curr[0]
execute if score length _ matches 0 run return 1

#自动布局
function floating_ui:element/control/auto_layout/auto

data modify storage floating_ui:input summon.arg.type set value "item_display"
function floating_ui:macro/summon_with_rot with storage floating_ui:input summon.arg
execute as @n[tag=just,distance=..1] run function floating_ui:_new_control with storage floating_ui:temp child[-1][0]

data remove storage floating_ui:temp child[-1][0]
scoreboard players add @s floating_ui.child_z 10

function floating_ui:element/panel/add_child

data remove storage floating_ui:debug curr[0]