# scale the original new animation
tag @s remove floating_ui_schedule_new_animation

function timelist:_reset
data modify storage timelist:io event.run set value "function ui_for_csch:control/numberbox_group/init/schedule_set_scale"
function timelist:_setas
scoreboard players set inp int 3
function timelist:_setdelay
function timelist:_append