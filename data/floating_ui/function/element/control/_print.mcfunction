tellraw @a [{"nbt":"arg.prefix1","storage": "floating_ui:temp","color": "gray"},{"nbt":"item.components.minecraft:custom_data.data.ui.type","entity":"@s","color": "aqua"}," - ",{"nbt":"item.components.minecraft:custom_data.data.name","entity":"@s","color": "yellow"}]
function floating_ui:macro/print_control_nbt with entity @s {}

$data modify storage floating_ui:temp arg.prefix1 set value "|  $(prefix1)"
$data modify storage floating_ui:temp arg.prefix2 set value "|  $(prefix2)"
execute on passengers run function floating_ui:macro/print_control with entity @s item.components.minecraft:custom_data.data.ui 
$data modify storage floating_ui:temp arg.prefix1 set value "$(prefix1)"
$data modify storage floating_ui:temp arg.prefix2 set value "$(prefix2)"