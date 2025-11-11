#> floating_ui:element/control/animation/walk_anim_data

execute store result score length floating_ui.temp run data get storage floating_ui:temp anim.data
execute if score length floating_ui.temp matches 0 run return 1

data modify storage floating_ui:temp arg.key set from storage floating_ui:temp anim.data[0].key

#设置目标值
execute store success score isTo floating_ui.temp run data modify storage floating_ui:temp anim.data[0].type set value "by"
execute if score isTo floating_ui.temp matches 0 run function floating_ui:element/textcontrol/animation/get_target_value with storage floating_ui:temp arg
execute store result score isProperty floating_ui.temp run data get storage floating_ui:temp anim.data[0].isProperty
execute if score isProperty floating_ui.temp matches 1 if score isTo floating_ui.temp matches 0 run tellraw @a "isProperty Cannot be true while animation type is 'by'"
data modify storage floating_ui:temp arg.value set from storage floating_ui:temp anim.data[0].value
execute if score isProperty floating_ui.temp matches 1 run function floating_ui:element/textcontrol/animation/property_set with storage floating_ui:temp arg
execute unless score isProperty floating_ui.temp matches 1 run function floating_ui:element/control/animation/data_set
execute unless score isProperty floating_ui.temp matches 1 on passengers run function floating_ui:element/control/animation/data_set

data remove storage floating_ui:temp anim.data[0]
function floating_ui:element/control/animation/walk_anim_data