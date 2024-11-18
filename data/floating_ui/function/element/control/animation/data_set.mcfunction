#> floating_ui:element/control/animation/data_set

#unction floating_ui:util/tree/print_root with entity @s {}
#tellraw @a "data_set: $(key) -> $(value)"
#tellraw @a ["curr: ",{"nbt": "$(key)", "entity": "@s"}]
$execute store success score success _ run data modify entity @s $(key) set value $(value)
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)f
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)d
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)b
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)l
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)s
execute if score success _ matches 1 run return 1
$function floating_ui:util/_error_track {"ex":"UnboundedKeyValue","msg":"Error while set key: $(key) with value: $(value)"}