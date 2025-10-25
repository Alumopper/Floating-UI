#timelist:append_loop

# 列表正向转动
data modify storage timelist:io list_event prepend from storage timelist:io list_event[-1]
data remove storage timelist:io list_event[-1]

# 检查能否直接插入
scoreboard players remove timelist_loop int 1
execute store result score timelist_cmp int run data get storage timelist:io list_event[-1].time
execute if score timelist_cmp int <= timelist_tocmp int run scoreboard players set timelist_loop int 0

# 直接插入
execute if score timelist_loop int matches 0 run data modify storage timelist:io list_event append from storage timelist:io event

# 否则继续转动列表
execute if score timelist_loop int matches 1.. run function timelist:append_loop

# 递归回溯，反向转动复原列表
data modify storage timelist:io list_event append from storage timelist:io list_event[0]
data remove storage timelist:io list_event[0]