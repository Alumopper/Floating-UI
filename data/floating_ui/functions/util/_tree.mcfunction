execute if entity @s[tag=!floating_ui_root] run return 0
#打印
tellraw Alumopper_ "root"
tellraw Alumopper_ [{"nbt":"UUID","entity":"@s"}]
data modify storage floating_ui:temp arg.prefix1 set value "|---"
data modify storage floating_ui:temp arg.prefix2 set value "|  "
data modify storage floating_ui:temp next.child prepend from entity @s data.childPoint
function floating_ui:util/tree/walk_child
#data remove storage floating_ui:temp next.child[0]