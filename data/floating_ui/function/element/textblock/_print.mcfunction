tellraw @a [{"nbt":"arg.prefix1","storage": "floating_ui:temp","color": "gray"},{"nbt":"item.components.minecraft:custom_data.data.ui.type","entity":"@s","color": "aqua"}," - ",{"nbt":"data.name","entity":"@s","color": "yellow"}]
function floating_ui:macro/print_control_nbt with entity @s {}
execute on passengers run function floating_ui:macro/print_control_nbt with entity @s {}