data modify storage floating_ui:data custom.'csch:attribute_card' set value {\
    "content": {\
        "type": "panel",\
        "tag":"csch_attribute_card",\
        "size": [1.75f, 0.75f],\
        "child": [\
            {\
                "type":"textblock",\
                "x": -0.3125,\
                "tag": "attr_title",\
                "text": "属性1",\
                "fontsize": 1.8f,\
                "width": 26\
            },\
            {\
                "type": "csch:numberbox_group",\
                "x": 0.5,\
                "tag": "attr_value",\
                "scale": 0.25f,\
                "enabled": false\
            }\
        ],\
        "init":"ui_for_csch:control/numberbox_group/init"\
    },\
    "params": [\
        {"key": "title", "path": "child[0].text"}\
    ],\
}

#executor panel
data modify storage floating_ui:data anim.'csch:attribute_card'.to_compressed set value {\
    "value": [\
        {\
            "key": "transformation.scale[1]",\
            "value": 0.5625\
        }\
    ],\
    "time": 3,\
}


# executor numberbox_group
data modify storage floating_ui:data anim.'csch:attribute_card'.to_compressed_attr_value set value {\    
    "value": [\
        {\
            "key": "move_to",\
            "value": {x:0.5, y:0},\
            "isProperty": true\
        },\
        {\
            "key": "scale",\
            "value": 25,\
            "isProperty": true\
        }\
    ],\
    "time": 3,\
}

# executor textblock
data modify storage floating_ui:data anim.'csch:attribute_card'.to_compressed_attr_title set value {\    
    "value": [\
        {\
            "key": "offset",\
            "value": {x:-0.3125, y:0},\
            "isProperty": true\
        }\
    ],\
    "time": 3,\
}

#executor panel
data modify storage floating_ui:data anim.'csch:attribute_card'.to_normal set value {\
    "value": [\
        {\
            "key": "transformation.scale[1]",\
            "value": 0.75\
        }\
    ],\
    "time": 3,\
}

# executor numberbox_group
data modify storage floating_ui:data anim.'csch:attribute_card'.to_normal_attr_value set value {\    
    "value": [\
        {\
            "key": "move_to",\
            "value": {x:0.5, y:0},\
            "isProperty": true\
        },\
        {\
            "key": "scale",\
            "value": 25,\
            "isProperty": true\
        }\
    ],\
    "time": 3,\
}

# executor textblock
data modify storage floating_ui:data anim.'csch:attribute_card'.to_normal_attr_title set value {\    
    "value": [\
        {\
            "key": "offset",\
            "value": {x:-0.3125, y:0},\
            "isProperty": true\
        }\
    ],\
    "time": 3,\
}

#executor panel
data modify storage floating_ui:data anim.'csch:attribute_card'.to_expanded set value {\
    "value": [\
        {\
            "key": "transformation.scale[1]",\
            "value": 1.5\
        }\
    ],\
    "time": 3,\
}

# executor numberbox_group
data modify storage floating_ui:data anim.'csch:attribute_card'.to_expanded_attr_value set value {\    
    "value": [\
        {\
            "key": "move_to",\
            "value": {x:0, y:-0.3125},\
            "isProperty": true\
        },\
        {\
            "key": "scale",\
            "value": 75,\
            "isProperty": true\
        }\
    ],\
    "time": 3,\
}

# executor textblock
data modify storage floating_ui:data anim.'csch:attribute_card'.to_expanded_attr_title set value {\    
    "value": [\
        {\
            "key": "offset",\
            "value": {x:-0.3125, y:0.375},\
            "isProperty": true\
        }\
    ],\
    "time": 3,\
}