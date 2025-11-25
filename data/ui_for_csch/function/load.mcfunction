scoreboard objectives add csch.player.lectern minecraft.custom:interact_with_lectern
scoreboard objectives add csch.marker.lectern.ui dummy

scoreboard objectives add csch.ui.numberbox_group.value dummy
scoreboard objectives add csch.ui.numberbox_group.max dummy
scoreboard objectives add csch.ui.numberbox_group.min dummy

#register custom user controls
function ui_for_csch:control/numberbox_group
function ui_for_csch:control/attribute_card