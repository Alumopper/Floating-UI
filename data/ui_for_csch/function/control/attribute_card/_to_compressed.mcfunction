data modify storage floating_ui:input animate.data set from storage floating_ui:data anim.'csch:attribute_card'.to_compressed
function floating_ui:element/control/_play_animation
execute on passengers if entity @s[tag=value] run function floating_ui:element/control/_disable