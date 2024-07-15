
scoreboard players set #exist _ 1
$execute store success score #exist _ run function floating_ui:element/$(type)/animation/new
$execute if score #exist _ matches 0 run function floating_ui:util/_error_track {"ex":"NoSuchFunctionException","msg":"No such function: floating_ui:element/$(type)/animation/new"}