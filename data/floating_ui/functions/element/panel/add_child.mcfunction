#> floating_ui:element/panel/add_child
# 添加子元素
# @within floating_ui:element/panel/_new

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/add_child"
#父节点替换
data modify entity 0-0-0-0-2 Thrower set from entity @s UUID

execute store result score length _ run data get storage floating_ui:temp child[-1]
execute if score length _ matches 0 run data remove storage floating_ui:debug curr[0]
execute if score length _ matches 0 run return 1

data modify storage _ nextChild set from storage floating_ui:temp child[-1][-1]
execute store success score qwq _ run data modify storage _ nextChild.type set value "textblock"
#tellraw @a {"nbt":"nextChild","storage":"_"}
execute if score qwq _ matches 1 summon item_display run function floating_ui:_new_control with storage floating_ui:temp child[-1][-1]
execute unless score qwq _ matches 1 summon marker run function floating_ui:_new_control with storage floating_ui:temp child[-1][-1]

data remove storage floating_ui:temp child[-1][-1]
scoreboard players add @s floating_ui.child_z 10

function floating_ui:element/panel/add_child

data remove storage floating_ui:debug curr[0]