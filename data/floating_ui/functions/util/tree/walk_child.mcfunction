#> floating_ui:util/tree/walk_child
# @internal

execute store result score length _ run data get storage floating_ui:temp next.child[0]
execute if score length _ matches 0 run return 1
data modify entity 0-0-0-0-2 Thrower set from storage floating_ui:temp next.child[0][0]
execute as 0-0-0-0-2 on origin run function floating_ui:util/tree/next with storage floating_ui:temp arg
data remove storage floating_ui:temp next.child[0][0]
function floating_ui:util/tree/walk_child