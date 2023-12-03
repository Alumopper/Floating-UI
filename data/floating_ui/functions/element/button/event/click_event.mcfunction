#> floating_ui:element/button/event/click_event
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/button/event/click_event"
execute unless function floating_ui:element/control/event/pos_check run data remove storage floating_ui:debug curr[0]
execute unless function floating_ui:element/control/event/pos_check run return 0

execute if score click_status _ matches 1 run function floating_ui:element/button/event/left_click
execute if score click_status _ matches -1 run function floating_ui:element/button/event/right_click
data remove storage floating_ui:debug curr[0]