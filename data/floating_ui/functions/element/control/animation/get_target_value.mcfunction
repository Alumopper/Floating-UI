#> floating_ui:element/control/animation/get_target_value
# @internal
# @param key

$execute store result score curr_value _ run data get entity @s $(key) 10000
execute store result score delta _ run data get storage floating_ui:temp anim.data[0].value
scoreboard players operation curr_value _ += delta _
execute store result storage floating_ui:temp anim.data[0].value float 1 run scoreboard players get curr_value _