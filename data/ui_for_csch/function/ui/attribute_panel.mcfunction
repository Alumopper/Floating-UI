data modify storage floating_ui:input data set value {\
    "type":"panel",\
    "size":[6f,4f],\
    "child":[\
        {\
            "type": "panel",\
            "size": [2f, 4f],\
            "x": 2,\
            "move_out": "ui_for_csch:ui/attribute_panel/status/all_normal",\
            "child": [\
                 {\
                    "type":"csch:attribute_card",\
                    "y":1.5,\
                    "title": "耐力",\
                    "value_change": "ui_for_csch:ui/attribute_panel/value_change/sta",\
                    "move_in": "ui_for_csch:ui/attribute_panel/event/1",\
                    "tag": "sta",\
                },\
                {\
                    "type":"csch:attribute_card",\
                    "y":0.5,\
                    "title": "力量",\
                    "value_change": "ui_for_csch:ui/attribute_panel/value_change/pow",\
                    "move_in": "ui_for_csch:ui/attribute_panel/event/2",\
                    "tag": "pow",\
                },\
                {\
                    "type":"csch:attribute_card",\
                    "y":-0.5,\
                    "title": "精巧",\
                    "value_change": "ui_for_csch:ui/attribute_panel/value_change/dex",\
                    "move_in": "ui_for_csch:ui/attribute_panel/event/3",\
                    "tag": "dex",\
                },\
                {\
                    "type":"csch:attribute_card",\
                    "y":-1.5,\
                    "title": "智能",\
                    "value_change": "ui_for_csch:ui/attribute_panel/value_change/int",\
                    "move_in": "ui_for_csch:ui/attribute_panel/event/4",\
                    "tag": "int",\
                }\
            ]\
        }\
    ],\
    "init": "ui_for_csch:ui/attribute_panel/init",\
}