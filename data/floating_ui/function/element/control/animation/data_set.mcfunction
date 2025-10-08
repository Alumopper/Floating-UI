#> floating_ui:element/control/animation/data_set

#unction floating_ui:util/tree/print_root with entity @s {}
#$tellraw @a "data_set: $(key) -> $(value)"
#tellraw @a ["curr: ",{"nbt": "$(key)", "entity": "@s"}]
execute store success score success _ run function floating_ui:element/control/animation/data_set/int with storage floating_ui:temp arg
execute if score success _ matches 0 store success score success _ run function floating_ui:element/control/animation/data_set/float with storage floating_ui:temp arg
execute if score success _ matches 0 store success score success _ run function floating_ui:element/control/animation/data_set/double with storage floating_ui:temp arg
execute if score success _ matches 0 store success score success _ run function floating_ui:element/control/animation/data_set/byte with storage floating_ui:temp arg
execute if score success _ matches 0 store success score success _ run function floating_ui:element/control/animation/data_set/long with storage floating_ui:temp arg
execute if score success _ matches 0 store success score success _ run function floating_ui:element/control/animation/data_set/short with storage floating_ui:temp arg
execute if score success _ matches 1 run return 1
function floating_ui:element/control/animation/data_set/error with storage floating_ui:temp arg