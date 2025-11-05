#> floating_ui:_dispose_ui
# 清除一个UI
# @context as @s UI的根实体

#debug
execute if entity @s[type=!item_display] run return run function floating_ui:util/_error_track {"ex":"NotItemDisplayException","msg":"_dispose_ui must be called by an item_display entity."}
#end

#根实体只有一个节点
execute on passengers run function floating_ui:dispose_control with entity @s item.components.minecraft:custom_data.data.ui

kill @s
