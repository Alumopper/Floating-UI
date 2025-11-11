execute align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags: [csch_atri_lectern, csch.blackboard_uiport, csch.lectern_marker,just]}


execute if entity @s[y_rotation=135..180] run tag @n[tag=just,distance=0..1] add csch_atri_lectern_180
execute if entity @s[y_rotation=45..135] run tag @n[tag=just,distance=0..1] add csch_atri_lectern_90
execute if entity @s[y_rotation=-45..45] run tag @n[tag=just,distance=0..1] add csch_atri_lectern_0
execute if entity @s[y_rotation=-135..-45] run tag @n[tag=just,distance=0..1] add csch_atri_lectern_-90
execute if entity @s[y_rotation=-180..-135] run tag @n[tag=just,distance=0..1] add csch_atri_lectern_180

tag @n[tag=just, distance=0..1] remove just

execute if entity @s[y_rotation=135..180] run setblock ~ ~ ~ lectern[facing=north]
execute if entity @s[y_rotation=45..135] run setblock ~ ~ ~ lectern[facing=west]
execute if entity @s[y_rotation=-45..45] run setblock ~ ~ ~ lectern[facing=south]
execute if entity @s[y_rotation=-135..-45] run setblock ~ ~ ~ lectern[facing=east]
execute if entity @s[y_rotation=-180..-135] run setblock ~ ~ ~ lectern[facing=north]