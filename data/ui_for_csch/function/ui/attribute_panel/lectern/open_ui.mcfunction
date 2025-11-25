tag @s add csch_atri_lectern_displaying

data modify storage floating_ui:temp attr set from block ~ ~ ~ Book.components."minecraft:custom_data".char.attr

execute unless data storage floating_ui:temp attr.sta run data modify storage floating_ui:temp attr.sta set value 0
execute unless data storage floating_ui:temp attr.pow run data modify storage floating_ui:temp attr.pow set value 0
execute unless data storage floating_ui:temp attr.dex run data modify storage floating_ui:temp attr.dex set value 0
execute unless data storage floating_ui:temp attr.int run data modify storage floating_ui:temp attr.int set value 0

#load ui layout data
function ui_for_csch:ui/attribute_panel
data modify storage floating_ui:input data.child[0].value set from storage floating_ui:temp attr.sta
data modify storage floating_ui:input data.child[1].value set from storage floating_ui:temp attr.pow
data modify storage floating_ui:input data.child[2].value set from storage floating_ui:temp attr.dex
data modify storage floating_ui:input data.child[3].value set from storage floating_ui:temp attr.int

tag @p[distance=0..6,tag=curr] add floating_ui_owner
#create ui
execute if data entity @s[tag=csch_atri_lectern_180] data.pos rotated 180 0 run function ui_for_csch:ui/attribute_panel/lectern/open_ui/with_pos with entity @s data
execute if data entity @s[tag=csch_atri_lectern_-90] data.pos rotated -90 0 run function ui_for_csch:ui/attribute_panel/lectern/open_ui/with_pos with entity @s data
execute if data entity @s[tag=csch_atri_lectern_0] data.pos rotated 0 0 run function ui_for_csch:ui/attribute_panel/lectern/open_ui/with_pos with entity @s data
execute if data entity @s[tag=csch_atri_lectern_90] data.pos rotated 90 0 run function ui_for_csch:ui/attribute_panel/lectern/open_ui/with_pos with entity @s data
tag @p[distance=0..6,tag=curr] remove floating_ui_owner

#record ui's uid
scoreboard players operation @s csch.marker.lectern.ui = return floating_ui.temp
