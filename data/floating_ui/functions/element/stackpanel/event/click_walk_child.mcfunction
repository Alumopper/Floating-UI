#> floating_ui:element/panel/event/click_walk_child
# @internal

data modify storage floating_ui:debug curr prepend value "floating_ui:element/panel/event/click_walk_child"
execute store result score length _ run data get storage floating_ui:temp click.child[0]
execute if score length _ matches 0 run data remove storage floating_ui:debug curr[0]
execute if score length _ matches 0 run return 1
data modify entity 0-0-0-0-2 Thrower set from storage floating_ui:temp click.child[0][0]
execute as 0-0-0-0-2 on origin run data modify storage floating_ui:temp arg.type set from entity @s item.tag.data.ui.type
execute as 0-0-0-0-2 on origin run function floating_ui:interact/click/trigger with storage floating_ui:temp arg
data remove storage floating_ui:temp click.child[0][0]
function floating_ui:element/panel/event/click_walk_child
data remove storage floating_ui:debug curr[0]