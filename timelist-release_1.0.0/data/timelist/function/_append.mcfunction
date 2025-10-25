#timelist:_append
# 将临时对象事件加入事件队列
# 输入临时对象[timelist:io event]

# 获取要插入事件的时间
execute store result score timelist_tocmp int run data get storage timelist:io event.time

# 检查能否直接插入
scoreboard players operation timelist_loop int = list_event_cnt int
execute store result score timelist_cmp int run data get storage timelist:io list_event[-1].time
execute if score timelist_cmp int <= timelist_tocmp int run scoreboard players set timelist_loop int 0

# 直接插入
execute if score timelist_loop int matches 0 run data modify storage timelist:io list_event append from storage timelist:io event

# 否则开始转动列表
execute if score timelist_loop int matches 1.. run function timelist:append_loop

# 事件计数器自增
scoreboard players add list_event_cnt int 1