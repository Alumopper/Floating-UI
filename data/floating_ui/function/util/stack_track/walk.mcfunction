execute store result score length _ run data get storage floating_ui:debug temp
execute if score length _ matches 0 run return 1
scoreboard players add count _ 1
tellraw @a ["    ",{"nbt":"temp[0]","storage": "floating_ui:debug"}]
data remove storage floating_ui:debug temp[0]
execute if score count _ matches 20.. run tellraw @a ["    ..."]
execute if score count _ matches 20.. run return 1
function floating_ui:util/stack_track/walk