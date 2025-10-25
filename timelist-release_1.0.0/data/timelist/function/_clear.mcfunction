#timelist:_clear
# 清空事件队列

data modify storage timelist:io list_event set value []
scoreboard players set list_event_cnt int 0