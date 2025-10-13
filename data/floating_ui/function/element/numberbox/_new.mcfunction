#> floating_ui:element/numberbox/_new
# Create a new numberbox
# @internal
# @input storage floating_ui:input layout data of the ui

data modify storage floating_ui:debug curr prepend value "floating_ui:element/sprite/_new"


function floating_ui:element/control/_new

tag @s add floating_ui_numberbox

# value
execute unless data storage floating_ui:input temp.value run data modify storage floating_ui:input temp.value set value 0
execute store result entity @s item.components.minecraft:custom_data.data.value int 1.0 store result score @s floating_ui.numberbox.value run data get storage floating_ui:input temp.value

# max/min
execute unless data storage floating_ui:input temp.max run data modify storage floating_ui:input temp.max set value 0
execute store result entity @s item.components.minecraft:custom_data.data.max int 1.0 store result score @s floating_ui.numberbox.max run data get storage floating_ui:input temp.max
execute unless data storage floating_ui:input temp.min run data modify storage floating_ui:input temp.min set value 0
execute store result entity @s item.components.minecraft:custom_data.data.min int 1.0 store result score @s floating_ui.numberbox.min run data get storage floating_ui:input temp.min

#Height and width
execute store result score @s floating_ui.size0_without_scale store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1_without_scale store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000

# Replace the parent control uuid with current control
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID
# Generate child

data modify storage floating_ui:input summon.arg.type set value "item_display"
function floating_ui:macro/summon_with_rot with storage floating_ui:input summon.arg
data modify storage floating_ui:input temp set value {"type": "textblock"}
data modify storage floating_ui:input temp.text set from entity @s item.components.minecraft:custom_data.data.value
# size[1] = ((20 * line) + 2)*fontsize/80 =(line=1)=> size[1] = 11*fontsize/40
# fontsize = size[1] * 40 / 11
scoreboard players set fontSize _ 40
scoreboard players operation fontSize _ *= @s floating_ui.size1_without_scale
execute store result storage floating_ui:input temp.fontsize float 0.0001 run scoreboard players operation fontSize _ /= 11 int
execute as @n[tag=just, distance=..1] run function floating_ui:_new_control

data remove storage floating_ui:debug curr[0]