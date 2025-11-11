#timelist:run_loop

execute if score completed int matches 0 run return run function timelist:run_interrupt with storage timelist:io {}

# 加载执行参数
data modify entity 0-0-0-8593-0 Pos set from storage timelist:io list_event[0].at
data modify entity 0-0-0-8593-1 Thrower set from storage timelist:io list_event[0].as
data modify storage timelist:io run set from storage timelist:io list_event[0].run
data modify storage timelist:io run_space set from storage timelist:io list_event[0].run_space

# 回调命令
scoreboard players set success int 0
execute as 0-0-0-8593-1 on origin run scoreboard players set success int 1 
execute if score success int matches 0 run function timelist:executor_not_exisit with storage timelist:io {}

scoreboard players set completed int 0

execute as 0-0-0-8593-1 on origin positioned as 0-0-0-8593-0 store success score success int run function timelist:run with storage timelist:io {}

execute unless score success int matches 1 run function timelist:run_failed with storage timelist:io {}

scoreboard players set completed int 1

# 区块安全
tp 0-0-0-8593-0 0 11 0
# 移除事件
data remove storage timelist:io list_event[0]

# 检查事件队列
execute store result score timelist_cmp int run data get storage timelist:io list_event[0].time
execute if score timelist_cmp int <= timelist_time int if data storage timelist:io list_event[0] run function timelist:run_loop