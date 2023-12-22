#> floating_ui:util/tree/next
# @internal

function floating_ui:util/tree/print
execute if data entity @s item.tag.data.childPoint run data modify storage floating_ui:temp next.child prepend from entity @s item.tag.data.childPoint
$execute if data entity @s item.tag.data.childPoint run data modify storage floating_ui:temp arg.prefix1 set value "|  $(prefix1)"
$execute if data entity @s item.tag.data.childPoint run data modify storage floating_ui:temp arg.prefix2 set value "|  $(prefix2)"
execute if data entity @s item.tag.data.childPoint run function floating_ui:util/tree/walk_child
$data modify storage floating_ui:temp arg.prefix1 set value "$(prefix1)"
$data modify storage floating_ui:temp arg.prefix2 set value "$(prefix2)"
execute if data entity @s item.tag.data.childPoint run data remove storage floating_ui:temp next.child[0]