function ui_for_csch:control/attribute_card/_to_normal
data modify storage floating_ui:input temp set value {x: 0, y: 0.5}
scoreboard players set time floating_ui.temp 3
function floating_ui:element/control/_move_to