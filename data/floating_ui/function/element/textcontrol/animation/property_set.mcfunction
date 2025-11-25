scoreboard players set #exist floating_ui.temp 1
$execute store success score #exist floating_ui.temp run function floating_ui:element/textcontrol/animation/property/$(key) {value:$(value)}
$execute if score #exist floating_ui.temp matches 0 run function floating_ui:util/_error_track {"ex":"InvalidPropertyException","msg":"Invalid Property: $(key)"}