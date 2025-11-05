#文本
execute store success score isMultiline floating_ui.temp run data get storage floating_ui:input temp.text[0]
execute if score isMultiline floating_ui.temp matches 1 run data modify storage floating_ui:temp args.text set from storage floating_ui:input temp.text[0]
execute if score isMultiline floating_ui.temp matches 1 store result score line floating_ui.temp run data get storage floating_ui:input temp.text
execute if score isMultiline floating_ui.temp matches 1 run function floating_ui:element/textblock/append_multiline_text
execute if score isMultiline floating_ui.temp matches 0 run scoreboard players set line floating_ui.temp 1
execute if score isMultiline floating_ui.temp matches 0 run function floating_ui:element/textblock/set_text with storage floating_ui:input temp

# 若行数改变重新计算高度
execute if score line floating_ui.temp = @s floating_ui.text.line_count run return 1
# size[1] = ((20 * line) + 2)*fontsize/80
scoreboard players operation line floating_ui.temp *= 20 int
scoreboard players operation line floating_ui.temp += 2 int
execute store result score fontSize floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.fontsize 10000
scoreboard players operation line floating_ui.temp *= fontSize floating_ui.temp
scoreboard players operation line floating_ui.temp /= 80 int
execute store result entity @s item.components.minecraft:custom_data.data.size[1] float 0.0001 store result score @s floating_ui.size1_without_scale run scoreboard players get line floating_ui.temp
execute store result score @s floating_ui.size1 run data get entity @s item.components."minecraft:custom_data".data.scale 100
scoreboard players operation @s floating_ui.size1 *= @s floating_ui.size1_without_scale
scoreboard players operation @s floating_ui.size1 /= 100 int