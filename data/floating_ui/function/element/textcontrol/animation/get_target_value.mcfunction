#> floating_ui:element/control/animation/get_target_value
# @internal
# @param key

$execute store result score curr_value floating_ui.temp run data get entity @s $(key) 10000
execute store result score delta floating_ui.temp run data get storage floating_ui:temp anim.data[0].value
scoreboard players operation curr_value floating_ui.temp += delta floating_ui.temp
execute store result storage floating_ui:temp anim.data[0].value float 1 run scoreboard players get curr_value floating_ui.temp