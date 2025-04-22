using namespace System.Collections.Generic
using namespace System.Text

<#
.SYNOPSIS
    处理UI的Json数据文件，并编译为UI组件生成代码
    
.PARAMETER -f
    要处理的JSON文件路径数组
    
.EXAMPLE
    .\ProcessJson.ps1 -f "file1.json", "file2.json"
#>

param(
    [Parameter(Mandatory = $true, HelpMessage = "Json 文件名，可省略后缀")]
    [string[]]$f
)

[StringBuilder[]]$Global:mcf = [StringBuilder[]]@()
[AbstractControl]$Global:parent

function New-Control {
    [OutputType('AbstractControl')]
    param (
        $json
    )

    switch ($json.type) {
        'button'{ return [Button]::new($json) }
        'list' { return [List]::new($json) }
        'panel' { return [Panel]::new($json) }
        'textBlock' { return [TextBlock]::new($json) }
        default { throw "Unknown control type: $json.type" }
    }
    
}

function Get-Json {
    param(
        [string]$file
    )

    $json = Get-Content -Path $file -Raw | ConvertFrom-Json
    $control = New-Control -json $json
    Write-UI -control $control
}

#生成ui函数文件
function Write-UI {
    param(
        [AbstractControl]$control
    )
    
}

function Get-TagStr{

    [OutputType('string')]
    param(
        [string[]]$tags
    )

    [StringBuilder]$tagStr = [StringBuilder]::new("[")
    foreach ($tag in $tags) {
        $tagStr.Append($tag) | Out-Null
        $tagStr.Append(",") | Out-Null
    }
    if ($tagStr.Length -gt 1) {
        $tagStr.Remove($tagStr.Length - 1, 1) | Out-Null
    }
    $tagStr.Append("]") | Out-Null
    return $tagStr.ToString() 
}


class AbstractControl {
    [string]$type
    [float]$x
    [float]$y
    [float]$z
    [float]$rotation
    [string]$moveIn
    [string]$moveOut
    [string]$name
    [string[]]$tag
    [Animation]$moveInAnimation
    [Animation]$moveOutAnimation

    [float]$childX
    [float]$childY
    [float]$childZ
    [float]$parentX
    [float]$parentY
    [float]$parentZ
    [float]$rootX
    [float]$rootY
    [float]$rootZ
    [float]$rootXWithoutScale
    [float]$rootYWithoutScale
    [float]$rootZWithoutScale

    AbstractControl($json){
        $this.type = $json.type
        if($json.x){
            $this.x = $json.x
        }else{
            $this.x = 0
        }
        if($json.y){
            $this.y = $json.y
        }else{
            $this.y = 0
        }
        if($json.z){
            $this.z = $json.z
        }else{
            $this.z = 0
        }
        $this.rotation = $json.rotation
        $this.moveIn = $json.moveIn
        $this.moveOut = $json.moveOut
        $this.name = $json.name
        $this.tag = $json.tag

        if ($json.anim.move_in) {
            $this.moveInAnimation = [Animation]::new($json.anim.move_in)
        }

        if ($json.anim.move_out) {
            $this.moveOutAnimation = [Animation]::new($json.anim.move_out)
        }
    }

    [void] Write(){
        throw "Not implemented"
    }
}

class Animation {
    [AnimationProperty[]]$value

    Animation($json)  {
        $this.value = @()
        foreach ($item in $json.value) {
            $property = [AnimationProperty]::new($item)
            $this.value += $property
        }
    }
}

class AnimationProperty {
    [AnimationPropertyValue[]]$value
    [float]$time
    [string]$start
    [string]$end

    AnimationProperty($json){
        $this.value = @()
        foreach ($item in $json.value) {
            $propertyValue = [AnimationPropertyValue]::new($item)
            $this.value += $propertyValue
        }
        $this.time = $json.time
        $this.start = $json.start
        $this.end = $json.end
    }
}

class AnimationPropertyValue {
    [string]$key
    [string]$value

    AnimationPropertyValue($json){
        $this.key = $json.key
        $this.value = $json.value
    }
}

class Point{
    [float]$x
    [float]$y

    Point($json){
        $this.x = $json.x
        $this.y = $json.y
    }
}

class Item{
    [string]$id
    [int]$count
    [psobject]$tex
    [psobject]$data
    [hashtable]$components

    Item($json){
        $this.id = $json.id
        $this.count = $json.count
        $this.tex = $json.tex
        $this.data = $json.data
        $this.components = @()
        foreach ($key in $json.components.Keys) {
            $this.components[$key] = $json.components[$key]
        }
    }

    [string] ToString(){
        $item = @{
            id = $this.id
            count = $this.count
        }
        if ($this.tex) {
            $item.tex = $this.tex
        }
        if ($this.data) {
            $item.data = $this.data
        }
        if ($this.components) {
            $item.components = $this.components
        }
        return ($item | ConvertTo-Json -Compress)
    }
}

class Control: AbstractControl{
    [Animation]$newAnimation
    [Point]$size
    [DisplayMode]$display
    [Item]$item

    [bool]$hasNewAnimation = $false

    Control($json): base($json){
        if($json.size) { 
            $this.size = [Point]::new($json.size)
        }
        if($json.display) { 
            $this.display = [DisplayMode]::Parse([DisplayMode], $json.display, $true) 
        }
        if($json.item) {
            $this.item = [Item]::new($json.item)
        }else{
            $this.item = [Item]@{
                id = "minecraft:glass_pane"
                count = 1
                tex = $null
                data = $null
                components = $null
            }
        }
        
        if ($json.anim.new) {
            $this.hasNewAnimation = $true
            $this.newAnimation = [Animation]::new($json.anim.new)
        }else {
            $this.newAnimation = [Animation]@{
                value = {
                    [AnimationProperty]@{
                        value = {
                            [AnimationPropertyValue]@{
                                key = "transformation.scale[0]"
                                value = $this.size.x
                            }
                            [AnimationPropertyValue]@{
                                key = "transformation.scale[1]"
                                value = $this.size.y
                            }
                        }
                        time = 3
                    }
                }
            }
        }
    }

    [void] Write(){
        $this.WriteControl()
    }

    [void] WriteControl(){
        $curr = [StringBuilder]::new(@"
data modify entity @s item set value $($this.item)
data modify entity @s item.components.minecraft:custom_model_data set value $($this.item.tex)
data modify entity @s brightness set value {block: 15, sky: 15}
"@)
        if($this.name){
            $curr += "data modify storage floating_ui:input temp.this set from entity @s UUID`n"
            $curr += "execute as 1bf52-0-0-0-5 on origin run data modify entity @s item.components.minecraft:custom_data.data.names.$($this.name) set from storage floating_ui:input temp.this`n"
        }        
        if($this.tag){
            $t = $this.tag + "floating_ui_control"
            $curr += "data modify entity @s Tags set value $(Get-TagStr -tags $t)`n"
        }
        #set_offset
        $this.parentX = $Global:parent.childX
        $this.parentY = $Global:parent.childY
        $this.parentZ = $Global:parent.childZ
        $this.rootX = $Global:parent.rootX + $this.parentX + $this.x
        $this.rootY = $Global:parent.rootY + $this.parentY + $this.y
        $this.rootZ = $Global:parent.rootZ + $this.parentZ + $this.z
        $this.rootXWithoutScale = $this.rootX
        $this.rootYWithoutScale = $this.rootY
        $this.rootZWithoutScale = $this.rootZ
        $curr += @"
scoreboard players set @s floating_ui.parent_x $($this.parentX)
scoreboard players set @s floating_ui.parent_y $($this.parentY)
scoreboard players set @s floating_ui.parent_z $($this.parentZ)
scoreboard players set @s floating_ui.root_x $($this.rootX)
scoreboard players set @s floating_ui.root_y $($this.rootY)
scoreboard players set @s floating_ui.root_z $($this.rootZ)
scoreboard players set @s floating_ui.root_x_without_scale $($this.rootXWithoutScale)
scoreboard players set @s floating_ui.root_y_without_scale $($this.rootYWithoutScale)
scoreboard players set @s floating_ui.root_z_without_scale $($this.rootZWithoutScale)
data modify entity @s transformation.translation set value [$($this.rootX), $($this.rootY), $($this.rootZ)]
data modify entity @s item.components.minecraft:custom_data.data.x set value $($this.x)
data modify entity @s item.components.minecraft:custom_data.data.y set value $($this.y)
data modify entity @s item.components.minecraft:custom_data.data.z set value $($this.z)
data modify entity @s transformation.scale[2] set value 0.0f
"@

        #动画
        if($this.hasNewAnimation){
            $curr += "data modify entity @s transformation.scale set value [$($this.size.x), $($this.size.y), 0.0f]`n"
        }else {
            $curr += "data modify entity @s transformation.scale set value [0.0f, 0.0f, 0.0f]`n"
        }
    }
}

enum DisplayMode {
    None
    ThirdPersonLeftHand
    ThirdPersonRightHand
    FirstPersonLeftHand
    FirstPersonRightHand
    Head
    GUI
    Ground
    Fixed
}

class Button: Control {
    [string]$leftClick
    [string]$rightClick
    [AbstractControl]$content
    [Animation]$leftClickAnimation
    [Animation]$rightClickAnimation

    Button($json): base($json){
        $this.leftClick = $json.leftClick
        $this.rightClick = $json.rightClick
        $this.content = New-Control -json $json.content

        if ($json.leftClickAnimation) {
            $this.leftClickAnimation = [Animation]::new($json.anim.left_click)
        }

        if ($json.rightClickAnimation) {
            $this.rightClickAnimation = [Animation]::new($json.anim.right_click)
        }
    }
}

class List: Control {
    [AbstractControl[]]$child

    List($json): base($json){
        $this.child = @()
        foreach ($item in $json.child) {
            $control = New-Control json $item
            $this.child += $control
        }
    }
}

class Panel: Control {
    [AbstractControl[]]$child

    Panel($json): base($json){
        $this.child = @()
        foreach ($item in $json.child) {
            $control = New-Control -json $item
            $this.child += $control
        }
    }
}

class TextControl: AbstractControl {
    [int]$fontSize

    TextControl($json): base($json){
        $this.fontSize = $json.fontSize
    }
}

class TextBlock: TextControl {
    [string]$text
    [TextAlign]$align

    TextBlock($json): base($json){
        $this.text = $json.text
        $this.align = [TextAlign]::Parse([TextAlign], $json.align, $true)
    }
}

enum TextAlign {
    Left
    Center
    Right
}

# 确认文件是否存在
# 默认相对路径从./json开始，需要拼接路径
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
foreach($file in $f){
    #若不含拓展名，自动补全路径
    if(-not [System.IO.Path]::HasExtension($file)){
        $file = Join-Path $scriptDir "json\$file.json"
    }

    if(Test-Path $file -PathType Leaf){
        Write-Host "Processing file: $file"
        Get-Json -file $file
    }else {
        Write-Warning "File $file not found!"
    }
}