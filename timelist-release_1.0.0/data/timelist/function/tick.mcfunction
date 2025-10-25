#timelist:tick

# 检查事件队列
execute store result score timelist_cmp int run data get storage timelist:io list_event[0].time
execute if score timelist_cmp int <= timelist_time int if data storage timelist:io list_event[0] run function timelist:run_loop

# 增加绝对时间
scoreboard players add timelist_time int 1

schedule function timelist:tick 1t replace