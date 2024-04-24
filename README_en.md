# Floating UI

> [!Note]
> Some of the translations in this document is by machine and may not be accurate. If you find any errors, please feel free to submit a pull request.

Floating UI is a datapack with rich features, which allows you to create a floating and interactive UI in Minecraft in a pure vanilla way.

Before using Floating UI, you need to install [Xiaodou's Math Library](https://github.com/xiaodou8593/math2.0) and [Xiaodou's Event Queue](https://github.com/xiaodou8593/timelist). Floating UI uses Xiaodou's Math Library for calculations and Xiaodou's Event Queue to manage the timing of events.

## Basic Usage

**Before using Floating UI, please manually call `function floating_ui:load` to initialize the Floating UI library!**

### Create a UI

The simplest way to create a UI is to use the function `floating_ui:.player_new_ui`. This function will generate a UI facing the player four blocks away. Before calling this function, you need to pass in the layout data of the UI, for example:

```mcfunction
data modify floating_ui:input data set value {"type":"panel","size":[5f,5f],"child":[{"type":"button","y":0.3,"size":[2.5f,2.5f],"item":{"id":"apple"}}]}

function floating_ui:.player_new_ui
```

> [!Tip]
> If you are running a function in a datapack, you can use `\` to write layout data in a new line to improve the readability of layout data.

In addition, you can create a UI interface in a slightly more complex way, that is, using the function `floating_ui:_new_ui`. Here is how you can use this function:

```mcfunction
# Select the owner of the UI
tag player add floating_ui_owner

# Create a UI. Assume you have passed in the layout data here. Of course, you can directly replace with storage with the layout data.
execute summon marker run function floating_ui:_new_ui with storage floating_ui:input data
```

If you successfully execute the first method, you will see an apple floating in front of you in a glass box.

After creating a UI, the unique digital ID of the UI root entity will be stored in the `return` scoreboard of the `_` scoreboard whatever method you used. You can save this ID for further operations.

### Dispose a UI

You may need to close the UI after use. The simplest way is to use `.player_dispose_ui`. This will dispose all UIs owned by the player.

Or, if you want to dispose of a specific UI, you can use `floating_ui:_dispose_ui`. Note that this function requires a UI root entity as the executor. Typically, you can use this function like this:

```mcfunction
execute as @e[tag=floating_ui_root] if score @s floating_ui.uid matches <uid> run function floating_ui:_dispose_ui
```

### UI Owner

You may have noticed the term 'UI owner' mentioned in the previous section. In Floating UI, the concept of **UI owner** is introduced for compatibility with multiplayer games. Only the UI owner can interact with the UI, such as clicking, moving, etc.

If you use `floating_ui:.player_new_ui`, the executor of the command is the owner of the generated UI. If you use `floating_ui:_new_ui`, the entity with the `floating_ui_owner` tag before execution is the owner of the UI.

It is worth noting that if a UI has no owner, any player can interact with the UI, and this UI is called a **world UI**.*(Future Update)*

If a control's UI owner is a player, it (including the root node and all controls in it) will have the same score as the player on the `floating_ui.uid` scoreboard.

## UI Data

Floating UI uses UI data to generate UI. The UI data is an NBT compound tag. The UI data is divided into layout data and storage data. The layout data is used to read and draw the UI in the data packet, and the storage data will be stored in the root entity to save the information of this UI interface.

### Layout Data

We use an NBT compound tag to save all the information of a control or a UI. All members in curly braces represent the property values of this control. For example:

```json
{
    "type":"button",
    "x":0,
    "size":[5f,5f]
}
```

This indicates that this is a button control with a spacing of ` [0,20,0,20] ` from its parent control (in order of left, top, right, bottom), and a background color of blue

For another example:

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

This represents a panel control that contains a textblock and a button.

You can use the `x` and `y` properties to control the specific position of the control. The origin of the coordinates is in the lower-left corner, with the y-axis pointing upwards and the x-axis pointing to the right. More properties will be listed in the API below.

### Storage Data

The storage data will store the information of the UI. Most of the storage data is the same as the layout data, but for the `child` field in the child control, the storage data stores an NBT list, representing all child controls in this control. You can use the `Throwner-on method` to select child controls. Similarly, a control may also have a `parent` field, which is also an NBT value, representing the parent control of this control.

> [!Tip]
> You can find more examples in the `data/floating_ui/functions/test/load` folder of the datapack.

## Events

In Floating UI, events are used to control when a custom function is executed, such as when a control is just generated. Through events, you can better control the interactive or animation functions of the UI interface.

Events are usually assigned as part of the properties. For example, for a button:

```json
{
    "type":"button",
    "click":"example:event/click"
}
```

When the button is clicked, the `example:event/click` function will be executed.

The executor of the event is the control itself. You can access the player who triggered the event through the `floating_ui_owner` tag in the event function.

You can find all event triggers in the API below.

## Animation

With the help of the interpolation function of display entities, Floating UI implements support for animation. Generally speaking, all event triggers can be used as animation triggers.

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

An animation has two events, `start` and `end`, which are executed when the animation starts and ends, respectively. However, `start` and `end` cannot be used as animation triggers.

## Access the control

There are two ways to access controls: name and tag. The former can be used to access a specific single control, while the latter can be used to access multiple controls.

### name

To access a control with `name`, you need to add the `name` attribute in the layout data.

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

After that, you can access the UUID of the corresponding control by visiting `data.names.<name>` of the selected root entity, where `<name>` is the name attribute value of the control you want to access. One name can only correspond to one control. If same names are declared in different controls, the latter will override the former.

### tag

You can also set the `tag` attribute to add a tag to the control.

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

After that, you can use the `tag` option of the target selector to select the control you need.

```mcfunction
execute as @e[tag=fruit_button] run ...
```

## API

### Functions

Floating UI provides some functions for easy calling. The following functions are all omitted from the `floating_ui` namespace.

#### `.player_new_ui`

Create a new UI for the player according to the layout data in `floating_ui:input data`.

Directly call.

#### `.player_dispose_ui`

Dispose all UIs owned by the player.

Directly call.

#### `_new_ui`

Create a UI for the player with `floating_ui_owner` tag according to the layout data in `floating_ui:input data`.

Call like `execute summon item_display run function this`.

#### `_dispose_ui`

Dispose of the UI with the root entity as the executor.

Call like `execute as UI entity run function this`.

#### `.player_tree`

Output the structure of the UI of the player.

Directly call.

#### `util/_tree`

Output the structure of the UI of the function executor.

Call like `execute as UI entity run function this`.

### Class

Floating UI uses item display entities to draw UI, so you need to pass in the information of the item to be drawn when creating the UI. In general, you can draw more diverse and rich UI interfaces through resource packs.

We introduce the concept of class in Floating UI to better manage the UI. A class is a collection of properties and methods that are used to create and manage UI. The following is a list of classes in Floating UI.

#### `class Item`

`Item` represents an item that will be displayed by the item display entity. It is similar to the original item format, but with an additional `tex` attribute, which is actually the same as `tag.CustomModelData`, just to avoid long key names.

* (optional) `string id`: The id of the item. If the namespace is `minecraft`, it can be omitted. If this item is omitted, it defaults to `glass_pane`.
* (optional) `byte count`: The id of the item. If omitted, it defaults to `1b`. Basically useless.
* (optional) `long tex`: The CustomModelData of the item.
* (optional) `NBTCompound tag`: A compound tag, corresponding to the `tag` in the original item format.

---

> [!Important]
> Note that controls of abstract classes cannot be created

In the following text, layout properties are the part that can be read as input when creating the layout. Storage properties are the data used when rendering the data packet and are read-only.

#### `abstract class Control`

control is the parent class of most controls, containing basic properties.

Layout properties:

* `double x`: x coordinate
* `double y`: y coordinate
* `float[2] size`: The size of the control. Only for input
* `float[4] rotation`: A quaternion to control rotation of the control. Default value is \[0f,1f,0f,0f\]
* `string display`: The NBT `item_display` of the item display entity. The mode of the item display entity, used to transform the item model again. Optional values are: `none`, `thirdperson_lefthand`, `thirdperson_righthand`, `firstperson_lefthand`, `firstperson_righthand`, `head`, `gui`, `ground`, and `fixed`. Default value is `fixed`.
* `Item item`: The item that the item display entity will display
* `string move_in`: A namespace id of a function or function tag. Execute when the mouse cursor enters this control
* `string move_out`: A namespace id of a function or function tag. Execute when the mouse cursor leaves this control

Storage properties:

* `UUID parent`: The UUID array of the parent control of this control.

#### `abstract class TextControl`

`TextControl` is the parent class of text controls, containing some basic properties. Since it is difficult to store custom information in text display entities, textcontrol is divided into two entities: marker and text display entity. The marker is used to store information and is also a component of the UI node. You can access the corresponding text display entity through the marker.

Layout properties:

* `double x`: x coordinate
* `double y`: y coordinate
* `float fontsize`: The size of the font. Only for input
* `float[4] rotation`: A quaternion to control rotation of the control. Default value is \[0f,1f,0f,0f\]
* `string move_in`: A namespace id of a function or function tag. Execute when the mouse cursor enters this control
* `string move_out`: A namespace id of a function or function tag. Execute when the mouse cursor leaves this control

Storage properties:

* `UUID parent`: The UUID array of the parent control of this control.
* `UUID displayEntity`: The text display entity corresponding to this control.

#### `class Panel : Control`

`Panel` is a simple container that can hold some child controls

Layout properties:

* `list<Control> child`: Child controls

#### `class Button : Control`

`Button` is a basic button that can be clicked and perform some actions

Layout properties:

* `string left_click`: A namespace id of a function or function tag. Execute when the button is clicked with the left mouse button
* `string right_click`: A namespace id of a function or function tag. Execute when the button is clicked with the right mouse button
* `Control or TextControl content`: The content of the button, which is a control. If specified, ignore `item` and display the button as the specified control.

#### `class TextBlock : TextControl`

`TextBlock` is a basic text display area

Layout properties:

* `string text`: The string to display
    Or: `string[] text`: The string of multiple lines of text to display
* `align`: Text alignment, with `left`, `right`, and `center`. Default value is `left`

### Tags

Tag name|Description
-|-
floating_ui_root|Root entity
floating_ui_`Control Type`|Entity of this type of control

## Technical Details

### Storage Usage

Floating UI uses a lot of storage and macros to complete the drawing of the UI and the transfer of data. All storage namespaces are `floating_ui`.

* `input` is used for function input
  * `data` is used for API function input
  * `child` is used when traversing the child elements of a control. It is a list that stores the information of each level of child controls
  * `temp` is used for data when creating controls. It is stored in the control entity at the beginning of the control creation and then discarded
* `data` is used for data storage
* `debug` is used for debug
  * `curr` stores the call information of the stack. You can use `floating_ui:util/_stack_track` to output the stack information of the current position

> [!Tip]
> To use stack information in your own function, insert `data modify storage floating_ui:debug curr prepend value "namespace id"` at the beginning of the function call, and use `data remove storage floating_ui:debug curr[0]` at the end of the function call, otherwise memory leaks will occur
