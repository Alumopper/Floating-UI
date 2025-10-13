#> floating_ui:element/control/animation/data_set

#unction floating_ui:util/tree/print_root with entity @s {}
#$tellraw @a "data_set: $(key) -> $(value)"
#$tellraw @a ["curr: ",{"nbt": "$(key)", "entity": "@s"}]
scoreboard players reset success _
function floating_ui:element/control/animation/data_set/int with storage floating_ui:temp arg
execute unless score success _ matches -2147483648..2147483647 run function floating_ui:element/control/animation/data_set/float with storage floating_ui:temp arg
execute unless score success _ matches -2147483648..2147483647 run function floating_ui:element/control/animation/data_set/double with storage floating_ui:temp arg
execute unless score success _ matches -2147483648..2147483647 run function floating_ui:element/control/animation/data_set/byte with storage floating_ui:temp arg
execute unless score success _ matches -2147483648..2147483647 run function floating_ui:element/control/animation/data_set/long with storage floating_ui:temp arg
execute unless score success _ matches -2147483648..2147483647 run function floating_ui:element/control/animation/data_set/short with storage floating_ui:temp arg
execute if score success _ matches -2147483648..2147483647 run return 1
function floating_ui:element/control/animation/data_set/error with storage floating_ui:temp arg