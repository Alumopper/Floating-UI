#> floating_ui:util/tree/next
# @internal
function floating_ui:util/tree/print
$execute if entity @s[tag=floating_ui_has_child] run data modify storage floating_ui:temp arg.prefix1 set value "|  $(prefix1)"
$execute if entity @s[tag=floating_ui_has_child] run data modify storage floating_ui:temp arg.prefix2 set value "|  $(prefix2)"
execute if entity @s[tag=floating_ui_has_child] on passengers run function floating_ui:util/tree/next
$data modify storage floating_ui:temp arg.prefix1 set value "$(prefix1)"
$data modify storage floating_ui:temp arg.prefix2 set value "$(prefix2)"