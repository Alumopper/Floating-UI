data modify storage floating_ui:data custom.test set value {\
    "content": {\
        "type": "panel",\
        "name": "test",\
        "size": [5f, 5f],\
        "child": [\
            {\
                "type": "textblock",\
                "text": "default"\
            }\
        ]\
    },\
    "params": {\
        "text": "child[0].text"\
    }\
}

data modify storage floating_ui:input data set value {\
    "type": "test",\
    "params":[\
        {"key":"text", "value":"Hello FloatingUI"}\
    ],\
}
