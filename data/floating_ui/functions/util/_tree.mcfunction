#> floating_ui:util/_tree

data modify storage floating_ui:debug curr prepend value "floating_ui:_tree"
#打印
tellraw Alumopper_ {"text":"root","color": "green"}
tellraw Alumopper_ [{"nbt":"UUID","entity":"@s"}," ",{"selector":"@s","color":"gray"}]
data modify storage floating_ui:temp arg.prefix1 set value "|---"
data modify storage floating_ui:temp arg.prefix2 set value "|  "
data modify storage floating_ui:temp next.child prepend from entity @s data.childPoint
function floating_ui:util/tree/walk_child
#data remove storage floating_ui:temp next.child[0]
data remove storage floating_ui:debug curr[0]
execute if entity @s[tag=!floating_ui_root] run return 0