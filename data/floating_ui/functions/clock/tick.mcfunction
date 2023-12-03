#> floating_ui:clock/tick
# @within floating_ui:tick

data modify storage floating_ui:debug curr prepend value "floating_ui:clock/tick"
scoreboard players add clock.40 floating_ui.clock 1
execute if score clock.40 floating_ui.clock matches 40 run function floating_ui:clock/40
data remove storage floating_ui:debug curr[0]