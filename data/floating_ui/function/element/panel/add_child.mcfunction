#> floating_ui:element/panel/add_child
# 添加子元素
# @within floating_ui:element/panel/_new


#父节点替换
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID

execute store result score length floating_ui.temp run data get storage floating_ui:temp child[-1]
execute if score length floating_ui.temp matches 0 run return 1

#function log:_debug {msg: "Adding child to panel"}

data modify storage floating_ui:input summon.arg.type set value "item_display"
function floating_ui:macro/summon_with_rot with storage floating_ui:input summon.arg
data modify storage floating_ui:input temp set from storage floating_ui:temp child[-1][0]
execute unless data storage floating_ui:input temp.size run function floating_ui:macro/auto_size with storage floating_ui:input temp
execute as @n[tag=just,distance=..1] run function floating_ui:_new_control

data remove storage floating_ui:temp child[-1][0]
scoreboard players add @s floating_ui.child_z 10

function floating_ui:element/panel/add_child

