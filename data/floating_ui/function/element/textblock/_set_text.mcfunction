#文本
execute store success score isMultiline _ run data get storage floating_ui:input temp.text[0]
execute if score isMultiline _ matches 1 run data modify storage floating_ui:temp args.text set from storage floating_ui:input temp.text[0]
execute if score isMultiline _ matches 1 store result score line _ run data get storage floating_ui:input temp.text
execute if score isMultiline _ matches 1 run function floating_ui:element/textblock/append_multiline_text
execute if score isMultiline _ matches 0 run scoreboard players set line _ 1
execute if score isMultiline _ matches 0 run function floating_ui:element/textblock/set_text with storage floating_ui:input temp

# 若行数改变重新计算高度
execute if score line _ = @s floating_ui.text.line_count run return 1
# size[1] = ((20 * line) + 2)*fontsize/80
scoreboard players operation line _ *= 20 int
scoreboard players operation line _ += 2 int
execute store result score fontSize _ run data get entity @s item.components.minecraft:custom_data.data.fontsize 10000
scoreboard players operation line _ *= fontSize _
scoreboard players operation line _ /= 80 int
execute store result entity @s item.components.minecraft:custom_data.data.size[1] float 0.0001 store result score @s floating_ui.size1_without_scale run scoreboard players get line _
execute store result score @s floating_ui.size1 run data get entity @s item.components."minecraft:custom_data".data.scale 100
scoreboard players operation @s floating_ui.size1 *= @s floating_ui.size1_without_scale
scoreboard players operation @s floating_ui.size1 /= 100 int