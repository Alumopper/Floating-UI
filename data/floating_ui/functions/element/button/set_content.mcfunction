#> floating_ui:element/button/set_content
#@internal


data modify storage floating_ui:debug curr prepend value "floating_ui:element/button/set_content"


execute unless data storage floating_ui:input temp.content run return 0

#父节点替换
data modify entity 0-0-0-0-2 Thrower set from entity @s UUID
#生成控件
data modify storage floating_ui:temp child append value []
data modify storage floating_ui:temp child[-1] append from storage floating_ui:input temp.content

data modify storage _ nextChild set from storage floating_ui:temp child[-1][0]

execute store success score contentqwq _ run data modify storage _ nextChild.type set value "textblock"

execute if score contentqwq _ matches 1 summon item_display run function floating_ui:_new_control with storage floating_ui:temp child[-1][0]
execute unless score contentqwq _ matches 1 summon marker run function floating_ui:_new_control with storage floating_ui:temp child[-1][0]

#覆盖item属性
data modify entity @s item.id set value "glass_pane"
data modify entity @s item.tag.CustomModelData set value 11450000

data remove storage floating_ui:temp child[-1][0]
data remove storage floating_ui:temp child[-1]

data remove storage floating_ui:debug curr[0]