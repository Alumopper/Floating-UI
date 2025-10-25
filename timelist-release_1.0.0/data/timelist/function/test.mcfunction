#timelist:test

# 清空事件队列
function timelist:_clear

# 在玩家头顶放置一个钻石块，3s后执行
function timelist:_reset
data modify storage timelist:io event.run set value "setblock ~ ~ ~ diamond_block"
execute at @s positioned ~ ~2 ~ run function timelist:_setat
scoreboard players set inp int 60
function timelist:_setdelay
function timelist:_append

# 添加一个say world事件，执行者是玩家，1s后执行
function timelist:_reset
data modify storage timelist:io event.run set value "say world"
scoreboard players set inp int 20
function timelist:_setdelay
function timelist:_append

# 添加一个say hello事件，执行者是世界实体，5s后执行
function timelist:_reset
data modify storage timelist:io event.run set value "say hello"
execute as @e[tag=math_marker,limit=1] run function timelist:_setas
scoreboard players set inp int 100
function timelist:_setdelay
function timelist:_append