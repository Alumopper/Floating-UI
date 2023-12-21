#> floating_ui:load
# @private

data modify storage floating_ui:debug curr prepend value "floating_ui:load"

scoreboard objectives add int dummy
    scoreboard players set 2083 int 2083
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
#时钟
scoreboard objectives add floating_ui.clock dummy
    #>
    # @internal
    #define score_holder clock.40 floating_ui.clock
    execute unless score clock.40 floating_ui.clock matches -2147483648..2147483647 run scoreboard players set clock.40 floating_ui.clock 0
#UI的子控件位置控制（倍率10000）
scoreboard objectives add floating_ui.child_x dummy
scoreboard objectives add floating_ui.child_y dummy
scoreboard objectives add floating_ui.child_z dummy
#UI与root的相对位置（倍率10000）
scoreboard objectives add floating_ui.root_x dummy
scoreboard objectives add floating_ui.root_y dummy
scoreboard objectives add floating_ui.root_z dummy
#UI与父控件的相对位置（倍率10000）
scoreboard objectives add floating_ui.parent_x dummy
scoreboard objectives add floating_ui.parent_y dummy
scoreboard objectives add floating_ui.parent_z dummy
#textControl子类UI控件的长和宽（倍率10000）
scoreboard objectives add floating_ui.text.width dummy
scoreboard objectives add floating_ui.text.height dummy

data remove storage floating_ui:debug curr[0]