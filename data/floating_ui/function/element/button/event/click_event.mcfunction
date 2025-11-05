#> floating_ui:element/button/event/click_event
# @internal

execute unless function floating_ui:element/control/event/pos_check run return 0

execute if score click_status floating_ui.temp matches 1 run function floating_ui:element/button/event/left_click
execute if score click_status floating_ui.temp matches -1 run function floating_ui:element/button/event/right_click
