#> floating_ui:element/control/animation/walk_anim_data

execute store result score length _ run data get storage floating_ui:temp anim.data
execute if score length _ matches 0 run return 1

data modify storage floating_ui:temp arg.key set from storage floating_ui:temp anim.data[0].key

#设置目标值
execute store success score isTo _ run data modify storage floating_ui:temp anim.data[0].type set value "by"
execute if score isTo _ matches 0 run function floating_ui:element/control/animation/get_target_value with storage floating_ui:temp arg
execute store result score isProperty _ run data get storage floating_ui:temp anim.data[0].isProperty
execute if score isProperty _ matches 1 if score isTo _ matches 0 run tellraw @a "isProperty Cannot be true while animation type is 'by'"
data modify storage floating_ui:temp arg.value set from storage floating_ui:temp anim.data[0].value
execute if score isProperty _ matches 1 run function floating_ui:element/control/animation/property_set with storage floating_ui:temp arg
function floating_ui:element/control/animation/data_set with storage floating_ui:temp arg

data remove storage floating_ui:temp anim.data[0]
function floating_ui:element/control/animation/walk_anim_data