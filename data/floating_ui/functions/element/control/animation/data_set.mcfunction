#> floating_ui:element/control/animation/data_set

$execute store success score success _ run data modify entity @s $(key) set value $(value)
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)f
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)d
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)b
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)l
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)s
$execute if score success _ matches 0 run tellraw @a [{"text": "Error while set nbt of entity ","color":"yellow"},{"selector":"@s"},{"text": " with key:$(key) and value:$(value)","color":"yellow"}]