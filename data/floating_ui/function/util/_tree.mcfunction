#> floating_ui:util/_tree


#打印
tellraw @a {"text":"root","color": "green"}
function floating_ui:util/tree/print_root with entity @s {}
data modify storage floating_ui:temp arg.prefix1 set value "|---"
data modify storage floating_ui:temp arg.prefix2 set value "|  "
data modify storage floating_ui:temp next.child prepend from entity @s item.components.minecraft:custom_data.childPoint
execute on passengers run function floating_ui:macro/print_control with entity @s item.components.minecraft:custom_data.data.ui
#data remove storage floating_ui:temp next.child[0]

execute if entity @s[tag=!floating_ui_root] run return 0