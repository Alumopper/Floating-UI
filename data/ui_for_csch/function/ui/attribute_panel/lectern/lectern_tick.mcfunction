# take book off
execute if entity @s[tag=csch_atri_lectern_displaying] if block ~ ~ ~ lectern[has_book=false] run function ui_for_csch:ui/attribute_panel/lectern/lectern_interact

execute unless block ~ ~ ~ lectern run kill @s