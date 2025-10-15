#> floating_ui:element/textcontrol/event/pos_check
#是否落在平面内
# @internal



#获取相对于控件的坐标
scoreboard players operation this.u _ = return_u _
scoreboard players operation this.v _ = return_v _
scoreboard players operation this.u _ -= @s floating_ui.root_x
scoreboard players operation this.v _ -= @s floating_ui.root_y
#计算是否在范围内
scoreboard players operation width _ = @s floating_ui.text.width
scoreboard players operation height _ = @s floating_ui.text.height
scoreboard players operation width _ /= 2 int
scoreboard players operation this.u _ += width _
scoreboard players operation width _ *= 2 int

execute if score this.u _ matches 0.. if score this.u _ <= width _ if score this.v _ matches 0.. if score this.v _ <= height _ run return 1
return 0