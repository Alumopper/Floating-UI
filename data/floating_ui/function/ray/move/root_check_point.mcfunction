#> floating_ui:ray/click/root_check_point
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
execute store result score width floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.size[0] 5000.0
execute store result score height floating_ui.temp run data get entity @s item.components.minecraft:custom_data.data.size[1] 5000.0
scoreboard players operation cache_u floating_ui.temp = u int
scoreboard players operation cache_v floating_ui.temp = v int
scoreboard players operation u int += width floating_ui.temp
scoreboard players operation v int += height floating_ui.temp
scoreboard players operation width floating_ui.temp *= 2 int
scoreboard players operation height floating_ui.temp *= 2 int
scoreboard players set qwq floating_ui.temp 0
execute if score u int matches 0.. if score u int <= width floating_ui.temp if score v int matches 0.. if score v int <= height floating_ui.temp run scoreboard players set qwq floating_ui.temp 1
execute if score qwq floating_ui.temp matches 0 run return 0
#比较最近点
execute if score stempt int > min_stempt floating_ui.temp run return 0
scoreboard players operation min_stempt floating_ui.temp = stempt int
#储存数据
scoreboard players operation return_u floating_ui.temp = cache_u floating_ui.temp
scoreboard players operation return_v floating_ui.temp = cache_v floating_ui.temp
data modify storage floating_ui:temp floating_ui.return set from entity @s UUID