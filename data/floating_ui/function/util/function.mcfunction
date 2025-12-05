
#check if function is specified
execute unless data storage floating_ui:temp arg.function run return 0
#execute unless data storage floating_ui:temp arg.function run return run function floating_ui:util/function_error

execute store success score ok floating_ui.temp run function floating_ui:util/function_1 with storage floating_ui:temp arg

execute if score ok floating_ui.temp matches 0 run function log:_error {msg: "Error while executing function"}