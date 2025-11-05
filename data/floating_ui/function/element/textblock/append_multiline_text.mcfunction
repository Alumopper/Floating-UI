#> floating_ui:element/textblock/append_multiline_text
# 
# @within floating_ui:element/textblock/**



data remove storage floating_ui:input temp.text[0]
execute store result score length floating_ui.temp run data get storage floating_ui:input temp.text

execute if score length floating_ui.temp matches 0 run function floating_ui:element/textblock/set_text with storage floating_ui:temp args
execute if score length floating_ui.temp matches 0 run return 1

data modify storage floating_ui:temp args.appendText set from storage floating_ui:input temp.text[0]
function floating_ui:element/textblock/append_multiline_text_macro with storage floating_ui:temp args

function floating_ui:element/textblock/append_multiline_text

