#> floating_ui:schedule/animation
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:schedule/animation"
execute as @e[tag=floating_ui_schedule_new_animation,type=item_display] run function floating_ui:macro/animation with entity @s item.components.minecraft:custom_data.data.ui
tag @e[tag=floating_ui_schedule_new_animation] remove floating_ui_schedule_new_animation
data remove storage floating_ui:debug curr[0]