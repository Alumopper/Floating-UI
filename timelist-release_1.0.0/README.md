# timelist

事件队列

# 一个事件的临时对象

```mcfunction
{
	run: "say hi",
	as: [I;0,0,0,0],
	at: [0.0d,0.0d,0.0d],
	time: 8593296358,
	run_space:{}
}
```

# 清空事件队列

```mcfunction
function timelist:_clear
```

# 在玩家头顶放置一个钻石块，3s后执行

```mcfunction
function timelist:_reset
data modify storage timelist:io event.run set value "setblock ~ ~ ~ diamond_block"
execute at @s positioned ~ ~2 ~ run function timelist:_setat
scoreboard players set inp int 60
function timelist:_setdelay
function timelist:_append
```

# 添加一个say world事件，执行者是玩家，1s后执行

```mcfunction
function timelist:_reset
data modify storage timelist:io event.run set value "say world"
scoreboard players set inp int 20
function timelist:_setdelay
function timelist:_append
```

# 添加一个say hello事件，执行者是世界实体，5s后执行

```mcfunction
function timelist:_reset
data modify storage timelist:io event.run set value "say hello"
execute as @e[tag=math_marker,limit=1] run function timelist:_setas
scoreboard players set inp int 100
function timelist:_setdelay
function timelist:_append
```