execute store success score hasNewAnim _ run data get storage floating_ui:input temp.anim.new
execute if score hasNewAnim _ matches 1 run function floating_ui:element/control/_new/has_new_anim
execute unless score hasNewAnim _ matches 1 run function floating_ui:element/control/_new/hasnt_new_anim
tag @s add floating_ui_schedule_new_animation