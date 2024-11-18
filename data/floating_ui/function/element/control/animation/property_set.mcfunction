scoreboard players set #exist _ 1
$execute store success score #exist _ run function floating_ui:element/control/animation/property/$(key) {value:$(value)}
$execute if score #exist _ matches 0 run function floating_ui:util/_error_track {"ex":"InvalidPropertyException","msg":"Invalid Property: $(key)"}