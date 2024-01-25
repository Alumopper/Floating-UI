#> floating_ui:element/panel/dispose_child
# @within floating_ui:element/panel/_dispose

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/dispose_child"
execute store result score length _ run data get entity @s item.tag.data.childPoint
execute if score length _ matches 0 run data remove storage floating_ui:debug curr[0]
execute if score length _ matches 0 run return 1
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s item.tag.data.childPoint[0]
function floating_ui:dispose_control with entity @s item.tag.data.ui.child[-1]
data remove entity @s item.tag.data.childPoint[0]
data remove entity @s item.tag.data.ui.child[-1]
function floating_ui:element/panel/dispose_child
data remove storage floating_ui:debug curr[0]