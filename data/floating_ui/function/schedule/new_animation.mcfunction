#> floating_ui:schedule/new_animation
# @internal


execute as @e[tag=floating_ui_schedule_new_animation,type=item_display] run function floating_ui:macro/animation with entity @s item.components.minecraft:custom_data.data.ui
tag @e[tag=floating_ui_schedule_new_animation] remove floating_ui_schedule_new_animation
