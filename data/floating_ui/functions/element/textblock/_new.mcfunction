#> floating_ui:element/textblock/_new
# 创建一个新的textblock。
#
# @input storage floating_ui:input 要创建的ui的内容信息

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textblock/_new"
function floating_ui:element/textcontrol/_new

tag @s add floating_ui_textblock

execute as 0-0-0-0-4 on origin run function floating_ui:element/textblock/set_text_display

# 计算宽度和高度
data modify entity @s data.size set value [0.0f,0.0f]
execute store result entity @s data.size[0] float 0.024 as 0-0-0-0-4 on origin run data get entity @s line_width
execute store result score fontSize _ run data get entity @s data.fontsize 10000
execute store result entity @s data.size[1] float 0.00002 run scoreboard players operation fontSize _ *= line _ 

#居中
execute store result score text_y _ run data get entity @s data.size[1] 10000
scoreboard players operation root_y _ = @s floating_ui.root_y
execute as 0-0-0-0-4 on origin store result entity @s transformation.translation[1] float 0.0001 run scoreboard players operation root_y _ -= text_y _

data remove storage floating_ui:debug curr[0]