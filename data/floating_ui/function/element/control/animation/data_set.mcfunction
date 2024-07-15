#> floating_ui:element/control/animation/data_set

$execute store success score success _ run data modify entity @s $(key) set value $(value)
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)f
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)d
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)b
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)l
$execute if score success _ matches 0 store success score success _ run data modify entity @s $(key) set value $(value)s
$execute if score success _ matches 0 run function floating_ui:util/_error_track {"ex":"UnboundedKeyValue","msg":"Error while set key: $(key) with value: $(value)"}