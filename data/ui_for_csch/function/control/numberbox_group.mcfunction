data modify storage floating_ui:data custom.'csch:numberbox_group' set value {\
    "content": {\
        "type": "panel",\
        "size": [3f, 2f],\
        "child": [\
            {\
                "type": "textblock",\
                "text": "未设置文本",\
                "x": -0.5,\
                "width": 30\
            },\
            {\
                "type": "numberbox",\
                "x": 0.3,\
                "size": [0.4f, 1f],\
                "tag":"2",\
                "max": 9,\
                "min": 0,\
                "value_change":"ui_for_csch:control/numberbox_group/value_change"\
            },\
            {\
                "type": "numberbox",\
                "x": 0.7,\
                "size": [0.4f, 1f],\
                "tag":"1",\
                "max": 9,\
                "min": 0,\
                "value_change":"ui_for_csch:control/numberbox_group/value_change",\
                "value_exceed":"ui_for_csch:control/numberbox_group/exceed/1",\
                "value_below":"ui_for_csch:control/numberbox_group/below/1"\
            },\
            {\
                "type": "numberbox",\
                "x": 1.1,\
                "size": [0.4f, 1f],\
                "tag":"0",\
                "max": 9,\
                "min": 0,\
                "value_change":"ui_for_csch:control/numberbox_group/value_change",\
                "value_exceed":"ui_for_csch:control/numberbox_group/exceed/0",\
                "value_below":"ui_for_csch:control/numberbox_group/below/0"\
            }\
        ],\
        "init":"ui_for_csch:control/numberbox_group/init"\
    },\
    "params": {\
        "title": "child[0].text"\
    },\
    "custom_data":[\
        {"key": "value_change"}, \
        {"key": "value", "default": 0}, \
        {"key": "max", "default": 999},\
        {"key": "min", "default": 0}\
    ]\
}