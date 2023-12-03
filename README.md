# Floating UI
Floating UI是一个功能丰富的数据包，允许你使用纯原版的方式在Minecraft中创建一个浮空的可操作UI。

在使用Floating UI之前，你需要安装[小豆的数学库](https://github.com/xiaodou8593/math2.0)。Floating UI使用小豆的数学库进行计算。
## 使用
### 创建UI
要创建一个UI，最简单的方式是使用函数`floating_ui:.player_new_ui`。这个函数将会在执行者前方四格远的地方生成一个面向玩家的UI界面。在调用这个函数之前，你需要传入UI的布局数据，例如：
```
/data modify floating_ui:input data set value {"type":"panel","size":[5f,5f],"child":[{"type":"button","y":0.3,"size":[2.5f,2.5f],"item":{"id":"apple"}}]}

/function floating_ui:.player_new_ui
```
Tips：如果你是用函数运行的，可以使用`\`换行符提高布局数据的可读性。

除此之外，你也可以用稍微复杂一些的方式创建一个UI界面，也就是使用函数`floating_ui:_new_ui`。它的使用方法如下：
```
# 选定UI的拥有者
tag player add floating_ui_owner

# 创建一个UI。假设这里你已经传入了布局数据。当然，你也可以直接用布局数据替换with storage这一串。
execute summon marker run function floating_ui:_new_ui with storage floating_ui:input data
```
如果你使用第一种方法成功执行，那么你会看到一个被玻璃框装着的苹果浮在你的面前。

无论哪一种方法，在创建好一个UI之后，会在 `_` 记分板的`return`积分项中存入这个UI的唯一数字ID。你可以将这个ID保存下来以供后续进行进一步操作。

### 销毁UI
你可能需要在使用完毕后将UI关闭，即销毁UI。最简单的方法是`.player_dispose_ui`。这将会清除执行者玩家拥有的所有UI。

或者你想要清除某个具体的UI，则可以使用`floating_ui:_dispose_ui`。注意，这个函数需要一个UI的根节点作为执行者。通常来说你可以这样使用这个函数：
```
execute as @e if score @s floating_ui.uid matches UI的唯一数字id run function floating_ui:_dispose_ui
```
### UI的拥有者
你或许注意到了我们上文提到了一个叫做UI拥有者的名词。在Floating UI中，针对多人游戏的兼容，引入了**UI拥有者**的概念。只有UI的拥有者才能与这个UI进行交互，即进行点击，移动等操作。

如果你使用`floating_ui:.player_new_ui`，那么命令的执行者就是生成的UI的拥有者。如果你使用`floating_ui:_new_ui`，那么执行前带有`floating_ui_owner`标签的就是UI的拥有者。

值得注意的是，如果一个UI没有拥有者，那么任何玩家都可以与这个UI发生交互，这种UI被称作**世界UI**。
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
            "type":"button",
            "y":0.3,
            "size":[2.5f,2.5f],
            "item":{
                "id":"apple",
                "tex":1000250
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

## API
### 类
Floating UI使用物品展示实体进行UI的绘制，因此需要在创建UI时传入要绘制的物品的信息。一般来说，你可以通过资源包绘制出更多样而丰富的UI界面。
#### `class Item`
物品类表示一个将要被展示实体展示的物品，和原版物品格式基本相同。但是Floating UI额外添加了一个`tex`属性，实际作用和`tag.CustomModelData`相同，只是为了避免冗长的键名
* (可选)`string id`：物品的id。如果命名空间为`minecraft`可省略。若此项省略则默认为`glass_pane`
* (可选)`byte count`：物品的id。若省略则默认为`1b`。基本上没啥用
* (可选)`long tex`：物品的CustomModelData
* (可选)`NBTCompound tag`：一个复合标签，对应原版物品格式中的`tag`

---
#### 
> 注意，抽象类（abstract class）的控件不可被创建
#### `abstract class Control`
control是所有控件的父类，包含了基本的属性。

属性：
* `double x`：x坐标
* `double y`：y坐标
* `float[2] size`：控件的大小。只用于输入
* `float width`：控件的长度
* `float height`：控件的高度
* `Item item`：物品展示实体将要展示的物品
* `UUID parent`：这个控件的父控件的UUID数组。
* `list<UUID> childPoint`：这个控件可能的所有子控件的UUID数组列表。
* `string mouseIn`：一个函数或函数标签的命名空间id。鼠标准星进入这个控件
* `string mouseOut`：一个函数或函数标签的命名空间id。鼠标准星离开这个控件

方法：
* `floating_ui:element/control/_new`：构造函数。control不能被直接创建

#### `class Panel : Control`
panel是一个简单的容器，可以在其中放置一些子控件
* `list<Control> child`：子控件

#### `class Button : Clickable, Control`
button是一个基础的按钮，可以被点击并执行某些动作
* `string leftClicked`：一个函数或函数标签的命名空间id。使用鼠标左键点击了此按钮
* `string rightClicked`：一个函数或函数标签的命名空间id。使用鼠标右键点击了此按钮

## 技术细节
### Storage的使用
Floating UI使用了大量的Storage和宏来完成UI的绘制和数据的传递。所有储存的命名空间均为`floating_ui`，下文不再赘述
* input 用于函数的输入
    * data 用于API函数的输入
    * child 在遍历一个控件的子元素的时候使用。是一个列表，储存了每一级的子控件的信息
    * temp 在创建控件的时候使用的数据，在这个控件创建的开始就被储存在控件实体中，随后便被丢弃