#> floating_ui:_new_ui
# 需要输入数据作为参数。
#
# 调用方式：
# ```mcfunction
# tag player add floating_ui_owner
# execute summon marker run function floating_ui:_new_ui with storage floating_ui:input data
# ```
# 或直接调用
# ```mcfunction
# execute summon marker run function floating_ui:_new_ui with storage floating_ui:input data
# ```
# @input storage floating_ui:input data
# @context entity @s[type=marker]
# @return 生成的ui的编号

data modify storage floating_ui:debug curr prepend value "floating_ui:_new_ui"
tag @s add floating_ui_root
#储存数据
execute store result score @s floating_ui.x run data get entity @s Pos[0] 10000
execute store result score @s floating_ui.y run data get entity @s Pos[1] 10000
execute store result score @s floating_ui.z run data get entity @s Pos[2] 10000
execute store result score @s floating_ui.u run data get entity @s item.tag.x
execute store result score @s floating_ui.v run data get entity @s item.tag.y
execute positioned .0 .0 .0 run tp 0-0-0-0-0 ^ ^ ^1
execute store result score @s floating_ui.f0 run data get entity 0-0-0-0-0 Pos[0] 10000.0
execute store result score @s floating_ui.f1 run data get entity 0-0-0-0-0 Pos[1] 10000.0
execute store result score @s floating_ui.f2 run data get entity 0-0-0-0-0 Pos[2] 10000.0
tp 0-0-0-0-0 .0 .0 .0
data modify entity 0-0-0-0-2 Thrower set from entity @s UUID
#编号分配
scoreboard players operation @s floating_ui.uid = @p[tag=floating_ui_owner] uid
tag @p[tag=floating_ui_owner] add floating_ui_hasUI
execute unless score @s floating_ui.uid matches -2147483648..2147483647 run scoreboard players remove _static floating_ui.uid 1
execute unless score @s floating_ui.uid matches -2147483648..2147483647 run scoreboard players operation @s floating_ui.uid = _static floating_ui.uid
# 数据储存
data modify entity @s data.floating_ui set from storage floating_ui:input data
data modify storage floating_ui:input temp set from storage floating_ui:input data
$execute summon item_display run function floating_ui:element/$(type)/_new with storage floating_ui:input data
tag @a[tag=floating_ui_owner] remove floating_ui_owner
scoreboard players operation return _ = @s floating_ui.uid
data remove storage floating_ui:debug curr[0]