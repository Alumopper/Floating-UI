#大小
data modify entity @s start_interpolation set value 0
data modify entity @s interpolation_duration set value 3
data modify entity @s transformation.scale[0] set from entity @s item.tag.data.size[0]
data modify entity @s transformation.scale[1] set from entity @s item.tag.data.size[1]