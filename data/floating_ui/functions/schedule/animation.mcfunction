data modify storage floating_ui:debug curr prepend value "floating_ui:_new_ui"
execute as @e[tag=floating_ui_schedule_animation] run function floating_ui:schedule/animation_macro with entity @s item.tag.data.ui
tag @e[tag=floating_ui_schedule_animation] remove floating_ui_schedule_animation
data remove storage floating_ui:debug curr[0]