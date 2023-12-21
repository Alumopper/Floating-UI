#> floating_ui:element/textblock/append_multiline_text
# 
# @within floating_ui:element/textblock/**

data modify storage floating_ui:debug curr prepend value "floating_ui:element/textblock/append_multiline_text"

execute store result score length _ run data get storage floating_ui:temp text
execute if score length _ matches 0 run function floating_ui:element/textblock/set_text with storage floating_ui:temp args 
execute if score length _ matches 0 run data remove storage floating_ui:debug curr[0]
execute if score length _ matches 0 run return 1

data modify storage floating_ui:temp args.appendText set from storage floating_ui:temp text[0]
function floating_ui:element/textblock/append_multiline_text_macro with storage floating_ui:temp args

data remove storage floating_ui:temp child[0]

function floating_ui:element/textblock/append_multiline_text

data remove storage floating_ui:debug curr[0]