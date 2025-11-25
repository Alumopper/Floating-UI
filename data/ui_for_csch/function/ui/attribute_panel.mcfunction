data modify storage floating_ui:input data set value {\
    "type":"panel",\
    "size":[6f,4f],\
    "child":[\
        {\
            "type":"csch:numberbox_group",\
            "x":-1.5,\
            "y":1,\
            "title": "耐力",\
            "value_change": "ui_for_csch:ui/attribute_panel/value_change/sta",\
            "tag": sta,\
        },\
        {\
            "type":"csch:numberbox_group",\
            "x":1.5,\
            "y":1,\
            "title": "力量",\
            "value_change": "ui_for_csch:ui/attribute_panel/value_change/pow",\
            "tag": pow,\
        },\
        {\
            "type":"csch:numberbox_group",\
            "x":-1.5,\
            "y":-1,\
            "title": "精巧",\
            "value_change": "ui_for_csch:ui/attribute_panel/value_change/dex",\
            "tag": dex,\
        },\
        {\
            "type":"csch:numberbox_group",\
            "x":1.5,\
            "y":-1,\
            "title": "智能",\
            "value_change": "ui_for_csch:ui/attribute_panel/value_change/int",\
            "tag": int,\
        }\
    ],\
    "init": "ui_for_csch:ui/attribute_panel/init",\
}