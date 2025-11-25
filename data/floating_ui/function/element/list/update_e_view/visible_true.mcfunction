scoreboard players set @s floating_ui.visible 1
function floating_ui:element/control/_set_visible
data modify storage floating_ui:input animate set value {\
    id: "scale",\
    data:{\
        time:1, \
        value:[\
            {\
                key: "scale",\
                value: 100,\
                isProperty: true,\
                type:"to",\
            }\
        ],\
    }\
}
execute unless score @s floating_ui.list.childIndex = selected_index floating_ui.temp run data modify storage floating_ui:input animate.data.value[0].value set value 75
execute if entity @s[tag=floating_ui_schedule_new_animation] run scoreboard players set delay floating_ui.temp 7
execute unless entity @s[tag=floating_ui_schedule_new_animation] run scoreboard players set delay floating_ui.temp 0
function floating_ui:element/control/_play_animation