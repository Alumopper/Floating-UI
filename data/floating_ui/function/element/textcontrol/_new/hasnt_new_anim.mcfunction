data modify entity @s transformation.scale set value [0.0f,0.0f,0.0f]
data modify storage floating_ui:input temp.anim.new set value \
{\
    value:[\
        {\
            key:"transformation.scale[0]",\
            value:0f\
        },\
        {\
            key:"transformation.scale[1]",\
            value:0f\
        }\
    ],\
    time:3\
}
data modify storage floating_ui:input temp.anim.new.value[0].value set from storage floating_ui:input temp.scale[0]
data modify storage floating_ui:input temp.anim.new.value[1].value set from storage floating_ui:input temp.scale[1]