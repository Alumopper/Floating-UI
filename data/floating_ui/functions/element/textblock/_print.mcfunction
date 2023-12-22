tellraw @a [{"nbt":"arg.prefix1","storage": "floating_ui:temp","color": "gray"},{"nbt":"data.ui.type","entity":"@s","color": "aqua"}]
tellraw @a [{"nbt":"arg.prefix2","storage": "floating_ui:temp","color": "gray"},{"nbt":"UUID","entity":"@s","color": "white"}," ",{"selector":"@s"}]
data modify entity 0-0-0-0-4 Thrower set from entity @s data.displayEntity
execute as 0-0-0-0-4 on origin run tellraw @a [{"nbt":"arg.prefix2","storage": "floating_ui:temp","color": "gray"},{"nbt":"UUID","entity":"@s","color": "white"}," ",{"selector":"@s"}]