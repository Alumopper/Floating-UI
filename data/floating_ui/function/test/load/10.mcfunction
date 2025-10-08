data modify storage floating_ui:input data set value {\
    "type": "stackpanel",\
    "size":[5f,5f],\
    "template": {\
        "type":"button",\
        "size":[1.2f,1.2f],\
        "item":{\
            "id":"apple"\
        }\
    },\
    "child": {\
        "path": "temp qwq.value",\
        "binds": [\
            {\
                "source": "id",\
                "target": "item.id",\
            }\
        ]\
    }\
}
