#> floating_ui:util/_tree

data modify storage floating_ui:debug curr prepend value "floating_ui:_tree"
#打印
tellraw @p {"text":"root","color": "green"}
function floating_ui:util/tree/print_root with entity @s {}
data modify storage floating_ui:temp arg.prefix1 set value "|---"
data modify storage floating_ui:temp arg.prefix2 set value "|  "
data modify storage floating_ui:temp next.child prepend from entity @s item.components.minecraft:custom_data.childPoint
function floating_ui:util/tree/next with storage floating_ui:temp arg
#data remove storage floating_ui:temp next.child[0]
data remove storage floating_ui:debug curr[0]
execute if entity @s[tag=!floating_ui_root] run return 0