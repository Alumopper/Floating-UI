#timelist:_reset
# 初始化上下文中的事件临时对象

data modify storage timelist:io event set value {as:[I;0,0,-2053963776,0],at:[0.0d,0.0d,0.0d]}

# 继承当前上下文中的run_space
data modify storage timelist:io event.run_space set from storage timelist:io run_space

# 如果当前执行者是实体则继承
data modify storage timelist:io event.as set from entity @s UUID

# 继承当前执行坐标
# 这条命令打破了维度兼容性，如果要修复，则需要额外引入每个维度的世界实体加载器
tp 0-0-0-8593-0 ~ ~ ~
data modify storage timelist:io event.at set from entity 0-0-0-8593-0 Pos