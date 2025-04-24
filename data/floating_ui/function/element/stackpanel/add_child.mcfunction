#> floating_ui:element/stackpanel/add_child
# 添加子元素

data modify storage floating_ui:debug curr prepend value "floating_ui:element/stackpanel/add_child"
#父节点替换
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID

execute store result score length _ run data get storage floating_ui:temp child[-1]
execute if score length _ matches 0 run data remove storage floating_ui:debug curr[0]
execute if score length _ matches 0 run return 1

data modify storage floating_ui:input summon.arg.type set value "item_display"
function floating_ui:macro/summon_with_rot with storage floating_ui:input summon.arg
#自动布局
data modify storage floating_ui:input temp set from storage floating_ui:temp child[-1][0]
execute unless data storage floating_ui:input temp.size run function floating_ui:macro/auto_size with storage floating_ui:input temp

#更新初始位置
function floating_ui:element/stackpanel/auto_layout/before/_

#添加子控件
execute as @n[tag=just,distance=..1] run function floating_ui:_new_control
data modify entity @s item.components.minecraft:custom_data.data.childPoint append from entity @n[tag=just,distance=..1] UUID
scoreboard players add temp.childCount _ 1

#更新初始位置
function floating_ui:element/stackpanel/auto_layout/after/_

data remove storage floating_ui:temp child[-1][0]
scoreboard players add @s floating_ui.child_z 10

function floating_ui:element/stackpanel/add_child

data remove storage floating_ui:debug curr[0]