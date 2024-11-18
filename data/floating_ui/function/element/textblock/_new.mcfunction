#> floating_ui:element/textblock/_new
# 创建一个新的textblock。
#
# @input storage floating_ui:input 要创建的ui的内容信息

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textblock/_new"

function floating_ui:element/textcontrol/_new

tag @s add floating_ui_textblock

execute on passengers run function floating_ui:element/textblock/set_text_display

# 计算宽度
data modify entity @s item.components.minecraft:custom_data.data.size set value [0.0f,0.0f]
execute store result entity @s item.components.minecraft:custom_data.data.size[0] float 0.024 on passengers run data get entity @s line_width
# 计算高度
scoreboard players operation line _ *= 20 int
scoreboard players operation line _ += 2 int
execute store result score fontSize _ run data get entity @s item.components.minecraft:custom_data.data.fontsize 10000
scoreboard players operation line _ *= fontSize _
scoreboard players operation line _ /= 80 int
execute store result entity @s item.components.minecraft:custom_data.data.size[1] float 0.0001 run scoreboard players get line _

#居中
execute store result score text_y _ run data get entity @s item.components.minecraft:custom_data.data.size[1] 5000
scoreboard players operation root_y _ = @s floating_ui.root_y
execute on passengers store result entity @s transformation.translation[1] float 0.0001 run scoreboard players operation root_y _ -= text_y _
scoreboard players operation @s floating_ui.root_y = root_y _

# 动画。如果没有动画，插入默认动画，否则执行动画
execute store success score hasNewAnim _ run data get storage floating_ui:input temp.anim.new
execute unless score hasNewAnim _ matches 1 run data modify storage floating_ui:input temp.anim.new set value {value:[{key:"transformation.scale",value:0f}],time:3}
execute unless score hasNewAnim _ matches 1 on passengers run data modify storage floating_ui:input temp.anim.new.value[0].value set from storage floating_ui:input temp.fontsize
execute unless score hasNewAnim _ matches 1 run data modify entity @s transformation.scale set value [0.0f,0.0f,0.0f]
tag @s add floating_ui_schedule_animation

data modify entity @s item.components.minecraft:custom_data.data.size set from storage floating_ui:input temp.size

#高度和宽度
execute store result score @s floating_ui.size0_without_scale store result score @s floating_ui.size0 run data get entity @s item.components.minecraft:custom_data.data.size[0] 10000
execute store result score @s floating_ui.size1_without_scale store result score @s floating_ui.size1 run data get entity @s item.components.minecraft:custom_data.data.size[1] 10000
data remove storage floating_ui:debug curr[0]