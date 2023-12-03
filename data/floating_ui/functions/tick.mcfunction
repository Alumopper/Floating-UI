#> floating_ui:tick
# @private

data modify storage floating_ui:debug curr prepend value "floating_ui:tick"

# 交互
function floating_ui:interact/tick
# UI远离二十格自动销毁
execute as @a[tag=floating_ui_hasUI] at @s run function floating_ui:dispose/player
# 时钟
function floating_ui:clock/tick

data remove storage floating_ui:debug curr[0]