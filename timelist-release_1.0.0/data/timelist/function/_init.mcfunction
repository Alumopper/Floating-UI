#timelist:_init

# 建立记分板
scoreboard objectives add int dummy

# 主世界初始化操作
execute in minecraft:overworld run function timelist:init_overworld

# 初始化事件队列
data modify storage timelist:io list_event set value []
scoreboard players set list_event_cnt int 0

# 初始化run_space
data modify storage timelist:io run_space set value {}

# 初始化绝对时间
scoreboard players set timelist_time int 0

return 1