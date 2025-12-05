data modify storage floating_ui:input animate.data set from storage floating_ui:data anim.'csch:attribute_card'.to_expanded
function floating_ui:element/control/_play_animation

data modify storage floating_ui:input animate.data set from storage floating_ui:data anim.'csch:attribute_card'.to_expanded_attr_value
execute on passengers if entity @s[tag=attr_value] run function floating_ui:element/control/_play_animation
execute on passengers if entity @s[tag=attr_value] on passengers run function floating_ui:element/control/_enable

data modify storage floating_ui:input animate.data set from storage floating_ui:data anim.'csch:attribute_card'.to_expanded_attr_title
execute on passengers if entity @s[tag=attr_title] run function floating_ui:element/textcontrol/_play_animation