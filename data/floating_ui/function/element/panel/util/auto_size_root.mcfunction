data modify entity @n[tag=floating_ui_this, distance=..1] item.components.minecraft:custom_data.data.size set value [5.0f,5.0f]
data modify entity @n[tag=floating_ui_this, distance=..1] transformation.scale set value [5.0f,5.0f,0.0f]
tag @n[tag=floating_ui_this, distance=..1] remove floating_ui_this
return 1