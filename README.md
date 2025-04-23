# Floating UI

简体中文/[English](README_en.md)

Floating UI是一个功能丰富的数据包，允许你使用纯原版的方式在Minecraft中创建一个浮空的可操作UI。

在使用Floating UI之前，你需要安装[小豆的数学库](https://github.com/xiaodou8593/math2.0)和[小豆的事件队列](https://github.com/xiaodou8593/timelist)。Floating UI使用小豆的数学库进行计算，使用小豆的事件队列托管事件的定时触发效果。

## 基本使用

**在使用Floating UI之前，请手动调用`function floating_ui:load`对浮空UI库进行初始化！**

### 创建UI

要创建一个UI，最简单的方式是使用函数`floating_ui:.player_new_ui`。这个函数将会在执行者前方四格远的地方生成一个面向玩家的UI界面。在调用这个函数之前，你需要传入UI的布局数据，例如：

```mcfunction
data modify floating_ui:input data set value {"type":"panel","size":[5f,5f],"child":[{"type":"button","y":0.3,"size":[2.5f,2.5f],"item":{"id":"apple"}}]}

function floating_ui:.player_new_ui
```

Tips：如果你是用数据包中的函数运行的，可以使用`\`换行写布局数据以提高布局数据的可读性。

除此之外，你也可以用稍微复杂一些的方式创建一个UI界面，也就是使用函数`floating_ui:_new_ui`。它的使用方法如下：

```mcfunction
# 选定UI的拥有者
tag player add floating_ui_owner

# 创建一个UI。假设这里你已经传入了布局数据。当然，你也可以直接用布局数据替换with storage这一串。
execute summon item_display run function floating_ui:_new_ui with storage floating_ui:input data
```

如果你使用第一种方法成功执行，那么你会看到一个被玻璃框装着的苹果浮在你的面前。

无论哪一种方法，在创建好一个UI之后，会在 `_` 记分板的`return`积分项中存入这个UI根实体的唯一数字ID。你可以将这个ID保存下来以供后续进行进一步操作。

### 销毁UI

你可能需要在使用完毕后将UI关闭，即销毁UI。最简单的方法是`.player_dispose_ui`。这将会清除执行者玩家拥有的所有UI。

或者你想要清除某个具体的UI，则可以使用`floating_ui:_dispose_ui`。注意，这个函数需要一个UI的根节点作为执行者。通常来说你可以这样使用这个函数：

```mcfunction
execute as @e[tag=floating_ui_root] if score @s floating_ui.uid matches UI的唯一数字id run function floating_ui:_dispose_ui
```

### UI的拥有者

你或许注意到了我们上文提到了一个叫做UI拥有者的名词。在Floating UI中，针对多人游戏的兼容，引入了**UI拥有者**的概念。只有UI的拥有者才能与这个UI进行交互，即进行点击，移动等操作。

如果你使用`floating_ui:.player_new_ui`，那么命令的执行者就是生成的UI的拥有者。如果你使用`floating_ui:_new_ui`，那么执行前带有`floating_ui_owner`标签的就是UI的拥有者。

值得注意的是，如果一个UI没有拥有者，那么任何玩家都可以与这个UI发生交互，这种UI被称作**世界UI**。

如果一个控件的UI拥有者是一个玩家，那么它（包括根节点和其中所有的控件）会和这个玩家在`floating_ui.uid`记分板上拥有相同的分数。

## UI数据

Floating UI使用UI数据对UI进行生成。UI数据是一个NBT复合标签。UI数据分为布局数据和储存数据。布局数据用于数据包读取并绘制UI，储存数据将会储存在root实体中，保存这个UI界面的信息。

### 布局数据

我们用一个花括号保存一个控件或一个UI的所有信息。花括号中的所有成员表示这个控件的属性值。例如

```json
{
    "type":"button",
    "x":0,
    "size":[5f,5f]
}
```

表示这是一个button控件，它与父控件的间距为`[0,20,0,20]`（按照左，上，右，下的顺序），同时背景颜色为蓝色
又比如

```json
{
    "type":"panel",
    "size":[5f,5f],
    "child":[
        {
            "type":"textblock",
            "text":"Hello FloatingUI",
            "y":1f,
            "fontsize":2.0f
        },
        {
            "type":"button",
            "y":-1f,
            "size":[1.2f,1.2f],
            "item":{
                "id":"apple"
            }
        }
    ]
}
```

表示了一个面板控件，其中包含了一个button。

你可以使用`x`和`y`属性控制控件具体的位置。坐标原点在左下角，向上为y的正方向，向右为x的正方向。更多的属性将会在下面的API中列出。

### 储存数据

储存数据将会储存UI的信息。储存数据的大部分和布局数据相同，但是对于子控件`child`字段，储存数据中储存的是一个NBT列表，表示了控件中的所有子空间。可以使用Throwner-on方法选取子控件。同样的，一个控件也可能会有`parent`字段，同样也是一个NBT值，表示这个控件的父控件。

## 事件

在Floating UI中，事件用于控制在特定时候执行某一个自定义的函数，比如在控件刚刚生成的时候。通过事件，能够更好的控制UI界面的交互功能或者动画功能。

事件通常作为属性的一部分被赋值。例如对按钮：

```json
{
    "type":"button",
    "click":"example:event/click"
}
```

在按钮被点击的时候，就会执行`example:event/click`函数

事件的执行者是控件自己。你可以在事件中使用`floating_ui_owner`这个标签访问到触发事件的玩家。

## 动画

借助Minecraft展示实体的插值功能，Floating UI提供了一些动画功能。理论上，只要是事件触发的时候，都可以触发动画。

```json
{
    "type":"panel",
    "anim":{
        "move_in":{
            "value":[
                {
                    "key":"transformation.scale[]",
                    "value":3f
                }
            ],
            "time":3,
            "start":"example:event/anim/start",
            "end":"example:event/anim/end"
        }
    }
}
```

动画还有两个事件，即`start`和`end`，分别用于在动画开始和动画结束的时候执行。但是`start`和`end`并不能作为动画的触发器使用。

## 控件模板

控件模板指的是一个可以被多次使用的控件集合。通过使用控件模板，你可以在UI中使用相似的控件，而不需要重复编写相同的代码。控件模板的定义和使用都很简单。

```json
{
    "$schema": "https://alumopper.top/res/json/schema/custom_control.json",
    "content": {
        "type": "panel",
        "name": "test",
        "size": [5f, 5f],
        "child": [
            {
                "type": "textblock",
                "text": "default"
            }
        ]
    },
    "params": {
        "text": "child[0].text"
    }
}
```

其中，`content`字段表示了这个控件模板中的内容，其格式和布局数据完全相同。而`params`字段表示了这个控件模板的参数。参数的格式是一个键值对，键表示参数的名称，值表示参数在控件模板中相对模板根路径的NBT路径。

要注册控件模板，你需要将这个控件模板的数据储存在`storage floating_ui:data custom.test.<模板名>`下。

```mcfunction
data modify storage floating_ui:data custom.test set value {\
    "content": {\
        "type": "panel",\
        "name": "test",\
        "size": [5f, 5f],\
        "child": [\
            {\
                "type": "textblock",\
                "text": "default"\
            }\
        ]\
    },\
    "params": {\
        "text": "child[0].text"\
    }\
}
```

随后，你就可以像使用普通控件一样使用这个控件模板了。

```json
{
    "type": "test",
    "params":[
        {"key":"text", "value":"Hello FloatingUI"}
    ],
}
```

```mcfunction
data modify storage floating_ui:input data set value {\
    "type": "test",\
    "params":[\
        {"key":"text", "value":"Hello FloatingUI"}\
    ],\
}
```

`type`字段就是你刚刚注册的模板名，而`params`列表对应了你注册的模板中的参数。`key`字段表示参数的名称，`value`字段表示参数的值。
`params`列表中的参数会被传入到控件模板中，替换掉控件模板中对应NBT路径上的值。

## 控件的访问

对控件的访问有两种方式，一种是使用一对一的name列表访问，一种是使用tag访问多个控件。

### name

要使用name列表访问一个控件，你需要在布局数据中添加对应的name属性。

```json
{
    "type":"panel",
    "size":[5f,5f],
    "child":[
        {
            "name":"apple_button",
            "type":"button",
            "y":-1,
            "size":[1.2f,1.2f],
            "item":{
                "id":"apple"
            }
        }
    ]
}
```

之后，你可以在选中根实体的时候，访问`data.names.<name>`这个nbt来获取对应控件的uuid，其中的`<name>`就填写你要访问的控件的name属性值。一个name只能对应一个控件，如果声明了多个name，那么靠后的会覆盖靠前的。

### tag

你也可以设置`tag`属性，为控件添加一个标签

```json
{
    "type":"panel",
    "size":[5f,5f],
    "child":[
        {
            "tag":"fruit_button",
            "type":"button",
            "y":-1,
            "size":[1.2f,1.2f],
            "item":{
                "id":"apple"
            }
        },
        {
            "tag":"fruit_button",
            "type":"button",
            "y":1,
            "size":[1.2f,1.2f],
            "item":{
                "id":"carrot"
            }
        }
    ]
}
```

之后，你就可以使用目标选择器的tag选项来选中你需要的控件了。

```mcfunction
execute as @e[tag=fruit_button] run ...
```

## API

### 函数

Floating UI提供了一些便于调用的函数。以下函数全部略去`floating_ui`命名空间

#### `.player_new_ui`

按照floating_ui:input data中的布局数据，生成属于命令执行者的新UI。

直接调用。

#### `.player_dispose_ui`

销毁这个玩家拥有的全部UI

直接调用

#### `_new_ui`

按照floating_ui:input data中的布局数据，生成属于\[tag=floating_ui_owner\]玩家的UI。

需要`execute summon item_display run function this`进行调用

#### `_dispose_ui`

删除作为函数执行者的这个UI。

需要`execute as UI实体 run function this`进行调用

#### `.player_tree`

输出这个玩家的UI的结构。

直接调用。

#### `util/_tree`

输出作为函数执行者的UI的结构。

需要`execute as UI实体 run function this`进行调用

### 类

Floating UI使用物品展示实体进行UI的绘制，因此需要在创建UI时传入要绘制的物品的信息。一般来说，你可以通过资源包绘制出更多样而丰富的UI界面。

#### `class Item`

物品类表示一个将要被展示实体展示的物品，和原版物品格式基本相同。但是Floating UI额外添加了一个`tex`属性，实际作用和`tag.CustomModelData`相同，只是为了避免冗长的键名

* (可选)`string id`：物品的id。如果命名空间为`minecraft`可省略。若此项省略则默认为`glass_pane`
* (可选)`byte count`：物品的id。若省略则默认为`1b`。基本上没啥用
* (可选)`long tex`：物品的CustomModelData
* (可选)`nbt data`：一个复合标签，对应原版物品格式中的`components.minecraft:custom_data`
* (可选)`nbt components`：一个物品组件

---

> 注意，抽象类（abstract class）的控件不可被创建

在下文中，布局属性是在创建布局的时候可以被读取输入的部分。数据属性是数据包进行渲染时使用的数据，是只读的。

#### `abstract class Control`

control是大部分控件的父类，包含了基本的属性。

布局属性：

* `double x`：x坐标
* `double y`：y坐标
* `float[2] size`：控件的大小。只用于输入
* `float[4] rotation`：控件的旋转。是一个四元数。默认为\[0f,1f,0f,0f\]
* `string display`：对应物品展示实体的`item_display`。物品展示实体的模式，用于再次变换物品模型。可选的有：`none`、`thirdperson_lefthand`、`thirdperson_righthand`、`firstperson_lefthand`、`firstperson_righthand`、`head`、`gui`、`ground`和`fixed`。默认为`fixed`。
* `Item item`：物品展示实体将要展示的物品
* `string move_in`：一个函数或函数标签的命名空间id。鼠标准星进入这个控件
* `string move_out`：一个函数或函数标签的命名空间id。鼠标准星离开这个控件

数据属性：
* `list<UUID> childPoint`：这个控件可能的所有子控件的UUID数组列表。

#### `abstract class TextControl`

textcontrol是文本控件的父类，包含了一些基本的属性。由于文本展示实体难以储存自定义信息，因此textcontrol分为两个marker和文本展示实体两个实体组成，其中marker用于储存信息，同时也是UI界面节点的组成部分。可以通过marker访问到对应的文本展示实体。

布局属性：

* `double x`：x坐标
* `double y`：y坐标
* `float fontsize`：字体的大小。仅用于输入
* `float[4] rotation`：控件的旋转。是一个四元数。默认为\[0f,1f,0f,0f\]
* `string move_in`：一个函数或函数标签的命名空间id。鼠标准星进入这个控件
* `string move_out`：一个函数或函数标签的命名空间id。鼠标准星离开这个控件

数据属性：
* `UUID parent`：这个控件的父控件的UUID数组。
* `UUID displayEntity`：这个控件所对应的文本展示实体。

#### `class Panel : Control`

panel是一个简单的容器，可以在其中放置一些子控件
布局属性：

* `list<Control> child`：子控件

#### `class Button : Control`

button是一个基础的按钮，可以被点击并执行某些动作
布局属性：

* `string left_click`：一个函数或函数标签的命名空间id。使用鼠标左键点击了此按钮
* `string right_click`：一个函数或函数标签的命名空间id。使用鼠标右键点击了此按钮
* `Control或TextControl content`：按钮的内容，是一个控件。如果指定，则忽略`item`，而将按钮展示为指定的控件。

#### `class TextBlock : TextControl`

textblock是一个基本的文本展示区域
布局属性：

* `string text`：要展示的字符串
    或者：`string[] text`：要展示的多行文本的字符串
* `align`：文本对齐方式，有`left`，`right`，`center`三种。默认为`left`

### 标签一览

标签名|描述
-|-
floating_ui_root|根实体
floating_ui_控件种类|这个种类的控件的实体

## 技术细节

### Storage的使用

Floating UI使用了大量的Storage和宏来完成UI的绘制和数据的传递。所有储存的命名空间均为`floating_ui`，下文不再赘述

* input 用于函数的输入
  * data 用于API函数的输入
  * child 在遍历一个控件的子元素的时候使用。是一个列表，储存了每一级的子控件的信息
  * temp 在创建控件的时候使用的数据，在这个控件创建的开始就被储存在控件实体中，随后便被丢弃
* data 用于数据的储存
* debug 用于debug
  * curr 储存了堆栈的调用信息。可以使用`floating_ui:util/_stack_track`输出当前位置的堆栈信息
* tag 用于标记某种类型的控件

> 要在自己的函数使用堆栈信息，请在函数调用开始的位置插入`data modify storage floating_ui:debug curr prepend value "命名空间id"`，并在函数调用结束的时候使用`data remove storage floating_ui:debug curr[0]`，否则会发生内存泄漏
