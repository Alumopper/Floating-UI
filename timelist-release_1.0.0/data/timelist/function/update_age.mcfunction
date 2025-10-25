#timelist:update_age
# 刷新uuid_marker的Age防止消失

data modify entity 0-0-0-8593-1 Age set value 0

schedule function timelist:update_age 1s replace