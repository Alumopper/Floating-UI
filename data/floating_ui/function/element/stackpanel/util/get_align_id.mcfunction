execute if data storage floating_ui:input {temp:{align:"left"}} run return run scoreboard players set @s floating_ui.stackpanel.align 0
execute if data storage floating_ui:input {temp:{align:"center"}} run return run scoreboard players set @s floating_ui.stackpanel.align 1
execute if data storage floating_ui:input {temp:{align:"right"}} run return run scoreboard players set @s floating_ui.stackpanel.align 2
tellraw @s {"text":"[Floating UI] Unknown stackpanel align: ","color":"red","bold":true,"italic":false}