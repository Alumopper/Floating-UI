#> floating_ui:ray/click/check_point
# @within floating_ui:ray/click/each_check
# @context as @s 控件


#传参调用数学库
scoreboard players operation x int = @s floating_ui.x
scoreboard players operation y int = @s floating_ui.y
scoreboard players operation z int = @s floating_ui.z
scoreboard players operation f0 int = @s floating_ui.f0
scoreboard players operation f1 int = @s floating_ui.f1
scoreboard players operation f2 int = @s floating_ui.f2
execute as 1bf52-0-0-0-0 run function math:geom/plane/_facing
# 粒子显示
scoreboard players set particle int 2
execute as 1bf52-0-0-0-0 run function math:3vec/_tofpos
execute at 1bf52-0-0-0-0 run function math:_particle

execute if score res int matches 0 run return 0
execute if score stempt int matches ..0 run return 0
#如果看着平面，计算交点
scoreboard players set uvw_theta int 0
execute at @s as 1bf52-0-0-0-0 run function math:uvw/_base
function math:uvw/_vecto
#判断是否在平面内
execute store result score width _ run data get entity @s transformation.scale[0] 5000.0
execute store result score height _ run data get entity @s transformation.scale[1] 5000.0
scoreboard players operation u int += width _
scoreboard players operation v int += height _
scoreboard players operation width _ *= 2 int
scoreboard players operation height _ *= 2 int
execute if score u int matches 0.. if score u int <= width _ if score v int matches 0.. if score v int <= height _ run return 1
return 0