data modify storage floating_ui:data custom.'csch:attribute_card' set value {\
    "content": {\
        "type": "panel",\
        "size": [1.75f, 0.75f],\
        "child": [\
            {\
                "type":"textblock",\
                "x": -0.3125,\
                "text": "属性1",\
                "tag": "title",\
                "fontsize": 1.818f,\
            },\
            {\
                "type": "csch:numberbox_group",\
                "x": 0.5,\
                "tag": "value",\
                "text": "值",\
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
    "value": {\
        "value": [\
            {\
                "key": "transformation.scale[1]",\
                "value": 0.5625\
            }\
        ],\
        "time": 5,\
    }\
}

#executor panel
data modify storage floating_ui:data anim.'csch:attribute_card'.to_normal set value {\
    "value": [\
        {\
            "key": "transformation.scale[1]",\
            "value": 0.75\
        }\
    ],\
    "time": 5,\
}

#executor panel
data modify storage floating_ui:data anim.'csch:attribute_card'.to_expanded set value {\
    "value": [\
        {\
            "key": "transformation.scale[1]",\
            "value": 1.6875\
        }\
    ],\
    "time": 5,\
}

# executor numberbox_group
data modify storage floating_ui:data anim.'csch:attribute_card'.to_expanded.1 set value {\    
    "value": [\
        {\
            "key": "move_to",\
            "value": [0, 0.34375],\
        }\
    ],\
    "time": 5,\
}

# executor textblock
data modify storage floating_ui:data anim.'csch:attribute_card'.to_expanded.2 set value {\    
    "value": [\
        {\
            "key": "move_to",\
            "value": [-0.3125, 0.46875],\
        }\
    ],\
    "time": 5,\
}