#> floating_ui:util/_add_animation_event
# @internal
# @param function 要执行的函数名词 
# @param time 计划多少tick后执行

function timelist:_reset
$data modify storage timelist:io event.run set value "function $(function)"
$scoreboard players set inp int $(time)
function timelist:_setdelay
function timelist:_append