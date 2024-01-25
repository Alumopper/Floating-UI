#> floating_ui:load
# @private

#世界实体
#alias entity worldMarker 1bf52-0-0-0-0
#世界盔甲架
#alias entity worldAS 1bf52-0-0-0-1
#世界物品
#alias entity worldItem 1bf52-0-0-0-2
#世界交互实体
#alias entity worldInteraction 1bf52-0-0-0-3
#世界物品2
#alias entity worldItem2 1bf52-0-0-0-4
#世界物品3
#alias entity worldItem3 1bf52-0-0-0-5

data modify storage floating_ui:debug curr prepend value "floating_ui:load"

scoreboard objectives add int dummy
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
scoreboard objectives add floating_ui.stempt dummy
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

#region forceload
execute in overworld run forceload add 0 0
execute in overworld run forceload add 0 -1
execute in overworld run forceload add -1 0
execute in overworld run forceload add -1 -1
#endregion

#region entity
execute in overworld positioned .0 .0 .0 run summon marker ~ ~ ~ {UUID:[I;114514,0,0,0]}
execute in overworld positioned .0 .0 .0 run summon armor_stand ~ ~ ~ {UUID:[I;114514,0,0,1],Marker:1b,Invisible:1b}
execute in overworld positioned .0 3000.0 .0 run summon item ~ ~ ~ {NoGravity:1b,UUID:[I;114514,0,0,2],Item:{id:"minecraft:stone",Count:1b},PickupDelay:-32768s, Age:-32768s}
execute in overworld positioned .0 3000.0 .0 run summon interaction ~ ~ ~ {response:true,UUID:[I;114514,0,0,3],width:2,height:2}
execute in overworld positioned .0 3000.0 .0 run summon item ~ ~ ~ {NoGravity:1b,UUID:[I;114514,0,0,4],Item:{id:"minecraft:sand",Count:1b},PickupDelay:-32768s, Age:-32768s}
execute in overworld positioned .0 3000.0 .0 run summon item ~ ~ ~ {NoGravity:1b,UUID:[I;114514,0,0,5],Item:{id:"minecraft:glass",Count:1b},PickupDelay:-32768s, Age:-32768s}
#endregion

data remove storage floating_ui:debug curr[0]