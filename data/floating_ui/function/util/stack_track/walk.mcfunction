execute store result score length floating_ui.temp run data get storage floating_ui:debug temp
execute if score length floating_ui.temp matches 0 run return 1
scoreboard players add count floating_ui.temp 1
tellraw @a ["    ",{"nbt":"temp[0]","storage": "floating_ui:debug"}]
data remove storage floating_ui:debug temp[0]
execute if score count floating_ui.temp matches 20.. run tellraw @a ["    ..."]
execute if score count floating_ui.temp matches 20.. run return 1
function floating_ui:util/stack_track/walk