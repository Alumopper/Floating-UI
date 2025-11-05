function floating_ui:.player_dispose_ui

data modify storage floating_ui:input data set value {\
    "type":"panel",\
    "size":[6f,4f],\
    "child":[\
        {\
            "type":"panel",\
            "x":-1.5,\
            "y":-1,\
            "size":[3f,2f],\
            "child":[\
                {\
                    "type": "textblock",\
                    "text": "属性1",\
                    "x": -0.5,\
                    "width": 30\
                },\
                {\
                    "type": "numberbox",\
                    "x": 0.3,\
                    "size": [0.4f, 1f],\
                    "max": 9,\
                    "min": 0,\
                    "name":"2.2"\
                },\
                {\
                    "type": "numberbox",\
                    "x": 0.7,\
                    "size": [0.4f, 1f],\
                    "max": 9,\
                    "min": 0,\
                    "name":"2.1"\
                },\
                {\
                    "type": "numberbox",\
                    "x": 1.1,\
                    "size": [0.4f, 1f],\
                    "max": 9,\
                    "min": 0,\
                    "name":"2.0"\
                }\
            ]\
        }\
    ]\
}

function floating_ui:.player_new_ui