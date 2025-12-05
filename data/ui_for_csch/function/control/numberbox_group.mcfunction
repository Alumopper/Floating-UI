data modify storage floating_ui:data custom.'csch:numberbox_group' set value {\
    "content": {\
        "type": "panel",\
        "size": [1.5f, 1f],\
        "child": [\
            {\
                "type": "numberbox",\
                "x": -0.5f,\
                "size": [0.5f, 1f],\
                "tag":"2",\
                "max": 9,\
                "min": 0,\
                "value_change":"ui_for_csch:control/numberbox_group/value_change"\
            },\
            {\
                "type": "numberbox",\
                "size": [0.5f, 1f],\
                "tag":"1",\
                "max": 9,\
                "min": 0,\
                "value_change":"ui_for_csch:control/numberbox_group/value_change",\
                "value_exceed_max":"ui_for_csch:control/numberbox_group/exceed/1",\
                "value_below_min":"ui_for_csch:control/numberbox_group/below/1"\
            },\
            {\
                "type": "numberbox",\
                "x": 0.5f,\
                "size": [0.5f, 1f],\
                "tag":"0",\
                "max": 9,\
                "min": 0,\
                "value_change":"ui_for_csch:control/numberbox_group/value_change",\
                "value_exceed_max":"ui_for_csch:control/numberbox_group/exceed/0",\
                "value_below_min":"ui_for_csch:control/numberbox_group/below/0"\
            }\
        ],\
        "init":"ui_for_csch:control/numberbox_group/init"\
    },\
    "custom_data":[\
        {"key": "value_change"}, \
        {"key": "value", "default": 0}, \
        {"key": "max", "default": 999},\
        {"key": "min", "default": 0},\
        {"key": "scale"},\
        {"key": "enabled", "default": true},\
        {"key": "tag"}\
    ]\
}