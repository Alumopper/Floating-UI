tp @s ~ ~ ~ ~ ~

#文本
execute store success score isMultiline _ run data get storage floating_ui:input temp.text[0]
execute if score isMultiline _ matches 1 run data modify storage floating_ui:temp args.text set value ""
execute if score isMultiline _ matches 1 run function floating_ui:element/textblock/append_multiline_text
execute if score isMultiline _ matches 0 run function floating_ui:element/textblock/set_text with storage floating_ui:input temp

#宽度，默认为父控件的宽度
execute if data storage floating_ui:input temp.width run data modify entity @s line_width set from storage floating_ui:input temp.width 
execute unless data storage floating_ui:input temp.width run function floating_ui:element/textblock/set_width_from_parent

#对齐方式。默认为居左对齐
execute unless data storage floating_ui:input temp.align run data modify storage floating_ui:input temp.align set value "left"
data modify entity @s alignment set from storage floating_ui:input temp.align

data modify entity @s background set value 0