#> floating_ui:element/<custom_id>/_new
# Create a new <custom_id>
# @internal
# @input storage floating_ui:input layout data of the ui

data modify storage floating_ui:debug curr prepend value "floating_ui:element/sprite/_new"
function floating_ui:element/control/_new

# --------------------------------------
# tag @s add floating_ui_<control_id>
# --------------------------------------

# Add your custom control init code here

#...

# If your control has any child controls, you may write the code like this
#
# # Replace the parent control uuid with current control
# data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID
# # Generate child
# data modify storage floating_ui:temp child append value []
# data modify storage floating_ui:temp child[-1] append from storage floating_ui:input temp.content
# 
# data modify storage floating_ui:input summon.arg.type set value "item_display"
# function floating_ui:macro/summon_with_rot with storage floating_ui:input summon.arg
# data modify storage floating_ui:input temp set from storage floating_ui:input temp.content
# # Auto Layout
# execute unless data storage floating_ui:input temp.size run function floating_ui:macro/auto_size with storage floating_ui:input temp
# execute as @n[tag=just,distance=..1] run function floating_ui:_new_control

#Height and width
execute store result score @s floating_ui.size0_without_scale store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1_without_scale store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000

data remove storage floating_ui:debug curr[0]