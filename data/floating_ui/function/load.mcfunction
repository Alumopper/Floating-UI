#> floating_ui:load
# @private

# 世界实体
#alias entity worldMarker 1bf52-0-0-0-0
# 世界盔甲架
#alias entity worldAS 1bf52-0-0-0-1
# 世界物品
#alias entity worldItem 1bf52-0-0-0-2
# 世界交互实体
#alias entity worldInteraction 1bf52-0-0-0-3
# 世界物品2
#alias entity worldItem2 1bf52-0-0-0-4
# 世界物品3
#alias entity worldItem3 1bf52-0-0-0-5

data modify storage floating_ui:debug curr prepend value "floating_ui:load"

scoreboard objectives add int dummy
    function floating_ui:int_load
scoreboard objectives add _ dummy
scoreboard objectives add floating_ui.x dummy
scoreboard objectives add floating_ui.y dummy
scoreboard objectives add floating_ui.z dummy
scoreboard objectives add floating_ui.f0 dummy
scoreboard objectives add floating_ui.f1 dummy
scoreboard objectives add floating_ui.f2 dummy
scoreboard objectives add floating_ui.u dummy
scoreboard objectives add floating_ui.v dummy
scoreboard objectives add floating_ui.clicked_u dummy
scoreboard objectives add floating_ui.clicked_v dummy
#scoreboard objectives add floating_ui.stempt dummy 不知道做什么用的
scoreboard objectives add floating_ui.re dummy
#世界UI的编号
scoreboard objectives add floating_ui.uid dummy
    #> 
    # @internal
    #define score_holder _static floating_ui.uid
    execute unless score _static floating_ui.uid matches -2147483648..2147483647 run scoreboard players set _static floating_ui.uid 0
    execute unless score _static_player floating_ui.uid matches -2147483648..2147483647 run scoreboard players set _static_player floating_ui.uid 0
#时钟
scoreboard objectives add floating_ui.clock dummy
    #>
    # @internal
    #define score_holder clock.40 floating_ui.clock
    execute unless score clock.40 floating_ui.clock matches -2147483648..2147483647 run scoreboard players set clock.40 floating_ui.clock 0
#UI的子控件位置控制（倍率10000），决定子控件的中心位置
scoreboard objectives add floating_ui.child_x dummy
scoreboard objectives add floating_ui.child_y dummy
scoreboard objectives add floating_ui.child_z dummy
#UI与root的相对位置（倍率10000），决定控件的中心位置
scoreboard objectives add floating_ui.root_x dummy
scoreboard objectives add floating_ui.root_y dummy
scoreboard objectives add floating_ui.root_z dummy
#UI与父控件的相对位置（倍率10000），决定控件的中心位置
scoreboard objectives add floating_ui.parent_x dummy
scoreboard objectives add floating_ui.parent_y dummy
scoreboard objectives add floating_ui.parent_z dummy
#三种位置的未缩放版本
scoreboard objectives add floating_ui.child_x_without_scale dummy
scoreboard objectives add floating_ui.child_y_without_scale dummy
scoreboard objectives add floating_ui.child_z_without_scale dummy
scoreboard objectives add floating_ui.root_x_without_scale dummy
scoreboard objectives add floating_ui.root_y_without_scale dummy
scoreboard objectives add floating_ui.root_z_without_scale dummy
scoreboard objectives add floating_ui.parent_x_without_scale dummy
scoreboard objectives add floating_ui.parent_y_without_scale dummy
scoreboard objectives add floating_ui.parent_z_without_scale dummy
#UI的宽和高scale（倍率10000）
scoreboard objectives add floating_ui.size0 dummy
scoreboard objectives add floating_ui.size1 dummy
scoreboard objectives add floating_ui.size0_without_scale dummy
scoreboard objectives add floating_ui.size1_without_scale dummy
#textControl子类UI控件的长和宽（倍率10000）
scoreboard objectives add floating_ui.text.width dummy
scoreboard objectives add floating_ui.text.height dummy
#是否可见
scoreboard objectives add floating_ui.visible dummy
#list控件的子控件数量
scoreboard objectives add floating_ui.list.childCount dummy
#list控件的索引
scoreboard objectives add floating_ui.list.index dummy
#list控件的子控件在list中的索引
scoreboard objectives add floating_ui.list.childIndex dummy
#list控件现在正在显示的子空间的最大索引和最小索引（min闭区间，max开区间，min <= 显示范围 < max）
scoreboard objectives add floating_ui.list.minIndex dummy
scoreboard objectives add floating_ui.list.maxIndex dummy
#stackpanel的对齐模式
#0：左对齐，1：中间对齐，2：右对齐
scoreboard objectives add floating_ui.stackpanel.align dummy
#stackpanel的间隙（倍率10000）
scoreboard objectives add floating_ui.stackpanel.gap dummy
#stackpanel上一行的行高（倍率10000）
scoreboard objectives add floating_ui.stackpanel.currLineHeight dummy
#stackpanel当前行的宽度（倍率10000）
scoreboard objectives add floating_ui.stackpanel.currLineWidth dummy
#玩家快捷栏选中的位置
scoreboard objectives add floating_ui.slot dummy

#region forceload
execute in overworld run forceload add 0 0
execute in overworld run forceload add 0 -1
execute in overworld run forceload add -1 0
execute in overworld run forceload add -1 -1
#endregion

#region entity
execute in overworld positioned .0 .0 .0 run summon marker ~ ~ ~ {UUID:[I;114514,0,0,0]}
execute in overworld positioned .0 .0 .0 run summon armor_stand ~ ~ ~ {UUID:[I;114514,0,0,1],Marker:1b,Invisible:1b}
execute in overworld positioned .0 3000.0 .0 run summon item ~ ~ ~ {NoGravity:1b,UUID:[I;114514,0,0,2],Item:{id:"minecraft:stone",count:1b},PickupDelay:-32768s, Age:-32768s}
execute in overworld positioned .0 3000.0 .0 run summon interaction ~ ~ ~ {response:true,UUID:[I;114514,0,0,3],width:2,height:2}
execute in overworld positioned .0 3000.0 .0 run summon item ~ ~ ~ {NoGravity:1b,UUID:[I;114514,0,0,4],Item:{id:"minecraft:sand",count:1b},PickupDelay:-32768s, Age:-32768s}
execute in overworld positioned .0 3000.0 .0 run summon item ~ ~ ~ {NoGravity:1b,UUID:[I;114514,0,0,5],Item:{id:"minecraft:glass",count:1b},PickupDelay:-32768s, Age:-32768s}
#endregion

#region 控件注册
data modify storage floating_ui:data std set value {\
    "button":0b,\
    "list":0b, \
    "panel":0b, \
    "textblock":0b, \
    "stackpanel": 0b,\
}

data modify storage floating_ui:tag container set value {\
    "list":0b, \
    "panel":0b, \
}

#初始化数学库和事件队列
execute store success score mathlib _ run function math:_init
execute if score mathlib _ matches 0 run tellraw @s {"text":"[Floating UI]","color":"red","bold":true,"extra":[{"text":"Failed to initialize the math library.","color":"red"}]}
execute store success score timelist _ run function timelist:_init
execute if score timelist _ matches 0 run tellraw @s {"text":"[Floating UI]","color":"red","bold":true,"extra":[{"text":"Failed to initialize the time list.","color":"red"}]}

data remove storage floating_ui:debug curr[0]

#加载成功
tellraw @s {"text": "[Floating UI] ", "color": "green", "bold": true, "extra": [{"text": "Loaded successfully.", "color": "green"}]}