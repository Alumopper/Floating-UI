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
tp @s ~ ~ ~ ~ ~
tag @s add floating_ui_root
#储存数据
execute store result score @s floating_ui.x run data get entity @s Pos[0] 10000
execute store result score @s floating_ui.y run data get entity @s Pos[1] 10000
execute store result score @s floating_ui.z run data get entity @s Pos[2] 10000
execute store result score @s floating_ui.u run data get entity @s item.tag.x
execute store result score @s floating_ui.v run data get entity @s item.tag.y
execute positioned .0 .0 .0 run tp 1bf52-0-0-0-0 ^ ^ ^1
execute store result score @s floating_ui.f0 run data get entity 1bf52-0-0-0-0 Pos[0] 10000.0
execute store result score @s floating_ui.f1 run data get entity 1bf52-0-0-0-0 Pos[1] 10000.0
execute store result score @s floating_ui.f2 run data get entity 1bf52-0-0-0-0 Pos[2] 10000.0
scoreboard players set @s floating_ui.root_x 0
scoreboard players set @s floating_ui.root_y 0
scoreboard players set @s floating_ui.child_x 0
scoreboard players set @s floating_ui.child_y 0
tp 1bf52-0-0-0-0 .0 .0 .0
data modify entity 1bf52-0-0-0-5 Thrower set from entity @s UUID
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID
#编号分配
scoreboard players operation @s floating_ui.uid = @p[tag=floating_ui_owner] floating_ui.uid
tag @p[tag=floating_ui_owner] add floating_ui_hasUI
execute unless score @s floating_ui.uid matches -2147483648..2147483647 run scoreboard players remove _static floating_ui.uid 1
execute unless score @s floating_ui.uid matches -2147483648..2147483647 run scoreboard players operation @s floating_ui.uid = _static floating_ui.uid
# UI数据储存
data modify entity @s data.floating_ui set from storage floating_ui:input data
data modify storage floating_ui:input temp set from storage floating_ui:input data
data modify storage floating_ui:input summon.arg.rotation set from entity @s Rotation
data modify storage floating_ui:input summon.arg.type set value "item_display"
function floating_ui:macro/summon_with_rot with storage floating_ui:input summon.arg
tag @e[tag=just,limit=1] add floating_ui_root_child
$execute as @e[tag=just,limit=1] run function floating_ui:element/$(type)/_new with storage floating_ui:input data
data modify entity @s data.size set from entity @e[tag=floating_ui_root_child,limit=1] item.tag.data.size
tag @a[tag=floating_ui_owner] remove floating_ui_owner
scoreboard players operation return _ = @s floating_ui.uid
data remove storage floating_ui:debug curr[0]
schedule function floating_ui:schedule/new_animation 3t