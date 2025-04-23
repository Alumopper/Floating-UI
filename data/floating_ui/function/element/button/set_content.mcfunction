#> floating_ui:element/button/set_content
#@internal


data modify storage floating_ui:debug curr prepend value "floating_ui:element/button/set_content"

#父节点替换
data modify entity 1bf52-0-0-0-2 Thrower set from entity @s UUID
#生成控件
data modify storage floating_ui:temp child append value []
data modify storage floating_ui:temp child[-1] append from storage floating_ui:input temp.content

#自动布局
function floating_ui:element/control/auto_layout/auto

data modify storage floating_ui:input summon.arg.type set value "item_display"
function floating_ui:macro/summon_with_rot with storage floating_ui:input summon.arg
execute as @n[tag=just,distance=..1] run function floating_ui:_new_control

#覆盖item属性
data modify entity @s item.id set value "glass_pane"
data modify entity @s item.components.minecraft:custom_model_data set value 11450000

data remove storage floating_ui:temp child[-1][0]
data remove storage floating_ui:temp child[-1]

data remove storage floating_ui:debug curr[0]