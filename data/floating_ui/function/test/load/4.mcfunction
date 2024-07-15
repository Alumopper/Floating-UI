data modify storage floating_ui:input data set value {\
    "type":"panel",\
    "size":[5f,5f],\
    "child":[\
        {\
            "type":"textblock",\
            "text":"Hello FloatingUI",\
            "y":1f,\
            "size":[2f,2f],\
            "align":"center"\
        },\
        {\
            "type":"button",\
            "y":-1f,\
            "size":[1.2f,1.2f],\
            "content":{\
                "type":"textblock",\
                "text":["Click","Me"],\
                "align":"center"\
            }\
        }\
    ]\
}