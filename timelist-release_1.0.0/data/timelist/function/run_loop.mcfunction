#timelist:run_loop

# 加载执行参数
data modify entity 0-0-0-8593-0 Pos set from storage timelist:io list_event[0].at
data modify entity 0-0-0-8593-1 Thrower set from storage timelist:io list_event[0].as
data modify storage timelist:io run set from storage timelist:io list_event[0].run
data modify storage timelist:io run_space set from storage timelist:io list_event[0].run_space

# 回调命令
execute as 0-0-0-8593-1 on origin positioned as 0-0-0-8593-0 run function timelist:run with storage timelist:io {}

# 区块安全
tp 0-0-0-8593-0 0 11 0

# 移除事件
data remove storage timelist:io list_event[0]

# 检查事件队列
execute store result score timelist_cmp int run data get storage timelist:io list_event[0].time
execute if score timelist_cmp int <= timelist_time int if data storage timelist:io list_event[0] run function timelist:run_loop