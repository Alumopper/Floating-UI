#> floating_ui:util/tree/next
# @internal
$data modify storage floating_ui:temp arg.prefix1 set value "|  $(prefix1)"
$data modify storage floating_ui:temp arg.prefix2 set value "|  $(prefix2)"
execute on passengers run function floating_ui:macro/print_control with entity @s item.components.minecraft:custom_data.data.ui
$data modify storage floating_ui:temp arg.prefix1 set value "$(prefix1)"
$data modify storage floating_ui:temp arg.prefix2 set value "$(prefix2)"