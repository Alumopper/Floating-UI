#@input score scale floating_ui.temp
#@input score time floating_ui.temp (optional)
#@input score delay floating_ui.temp (optional)
function floating_ui:element/control/set_scale/do
scoreboard players reset scale floating_ui.temp
scoreboard players reset time floating_ui.temp
scoreboard players reset delya floating_ui.temp