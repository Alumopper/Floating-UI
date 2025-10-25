#timelist:init_overworld

forceload add -1 -1 1 1

# 生成math_marker
kill @e[tag=math_marker,type=minecraft:marker]
summon marker 0 11 0 {Tags:["math_marker"],UUID:[I;0,0,-2053963776,0],CustomName:'{"text":"math_marker"}'}

# 生成uuid_marker
kill @e[tag=uuid_marker,type=minecraft:item]
summon item 0 -67 0 {Tags:["uuid_marker"],UUID:[I;0,0,-2053963776,1],NoGravity:1b,PickupDelay:32767s,CustomName:'{"text":"uuid_marker"}',Item:{id:"minecraft:glass",count:1b}}

# 刷新uuid_marker的Age防止消失
schedule function timelist:update_age 1s replace