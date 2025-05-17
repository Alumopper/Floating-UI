#> floating_ui:interact/player_tick
# @internal
# 玩家是否看向了UI

data modify storage floating_ui:debug curr prepend value "floating_ui:interact/player_tick"

tag @s add floating_ui_owner

execute as @e[type=item_display,tag=floating_ui_root,distance=..20] run function floating_ui:interact/is_ui_can_interact

# 获取玩家看着的UI。选择的结果储存在storage floating_ui:temp floating_ui.return中
execute anchored eyes positioned ^ ^ ^ run function floating_ui:ray/if_ray_ui

# 点击事件
execute if data storage floating_ui:temp floating_ui.return if entity @s[advancements={floating_ui:right_click=true}] run function floating_ui:interact/click/check
execute if data storage floating_ui:temp floating_ui.return if entity @s[advancements={floating_ui:left_click=true}] run function floating_ui:interact/click/check

# 光标移动事件
execute if data storage floating_ui:temp floating_ui.return run function floating_ui:interact/move_in/check
execute if data storage floating_ui:temp floating_ui.return run tag @s add floating_ui_lookingAtUI
execute unless data storage floating_ui:temp floating_ui.return run tag @s remove floating_ui_lookingAtUI

# 鼠标滚轮滚动事件
execute if data storage floating_ui:temp floating_ui.return if score @s floating_ui.slot matches -2147483648..2147483647 run function floating_ui:interact/roll/check
execute unless score @s floating_ui.slot matches -2147483648..2147483647 store result score @s floating_ui.slot run data get entity @s SelectedItemSlot

# 展示实体到处tp
execute as @s[tag=floating_ui_checkingClick] anchored eyes positioned ^ ^ ^ run tp 1bf52-0-0-0-3 ~ ~-0.5 ~
execute as @s[tag=!floating_ui_checkingClick] run tp 1bf52-0-0-0-3 .0 3000.0 .0
tag @s remove floating_ui_owner
tag @s[tag=floating_ui_lookingAtUI] add floating_ui_checkingClick
tag @s[tag=!floating_ui_lookingAtUI] remove floating_ui_checkingClick
data remove storage floating_ui:debug curr[0]