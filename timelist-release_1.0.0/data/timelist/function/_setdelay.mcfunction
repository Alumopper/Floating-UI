#timelist:_setdelay
# 设置事件的延时时间
# 输入<inp,int>

execute store result storage timelist:io event.time int 1 run scoreboard players operation timelist_time int += inp int
scoreboard players operation timelist_time int -= inp int

return 1