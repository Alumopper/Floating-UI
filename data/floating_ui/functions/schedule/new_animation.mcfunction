#> floating_ui:schedule/animation
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:schedule/animation"
execute as @e[tag=floating_ui_schedule_animation,type=item_display] run function floating_ui:macro/animation with entity @s item.tag.data.ui
execute as @e[tag=floating_ui_schedule_animation,type=marker] run function floating_ui:macro/animation with entity @s data.ui
tag @e[tag=floating_ui_schedule_animation] remove floating_ui_schedule_animation
data remove storage floating_ui:debug curr[0]