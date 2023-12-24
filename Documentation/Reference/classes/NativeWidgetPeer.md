**CLASS**

# `NativeWidgetPeer`

A widget.

## Properties
### `height`

The widget's height.

### `width`

The widget's width.

### `clickClosure`

The closure that gets executed when the widget is being clicked.

## Methods
### `init()`

Initialize a native widget peer.

### `hexpand(_:)`

Set whether the widget expands horizontally.
- Parameter enabled: Whether the widget expands horizontally.
- Returns: The widget.

### `vexpand(_:)`

Set whether the widget expands vertically.
- Parameter enabled: Whether the widget expands vertically.
- Returns: The widget.

### `halign(_:)`

The horizontal alignment of the widget.
- Parameter alignment: The alignment.
- Returns: The widget.

### `valign(_:)`

The vertical alignment of the widget.
- Parameter alignment: The alignment.
- Returns: The widget.

### `padding(_:_:)`

Set the padding for the widget.
- Parameters:
  - padding: The padding.
  - edges: The affected edges.
- Returns: The widget.

### `frame(minWidth:minHeight:)`

Set the minimum width and height of the widget.
- Parameters:
  - minWidth: The minimum width.
  - minHeight: The minimum height.
- Returns: The widget.

### `frame(maxSize:)`

Set the maximum size of the widget.
- Parameter maxSize: The maximum size.
- Returns: The widget.

### `addStyle(_:)`

Add a style class to the widget.
- Parameter style: The name of the style class.
- Returns: The widget.

### `sensitive(_:)`

Enable or disable the widget.
- Parameter sensitive: Whether the widget is enabled or disabled.
- Returns: The widget.

### `onClick(closure:)`

Set a closure that is executed when the widget is being clicked.
- Parameter closure: The closure.
- Returns: The widget.
