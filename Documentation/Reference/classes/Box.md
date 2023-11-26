**CLASS**

# `Box`

Gtk.Box

## Properties
### `peers`

The content.

## Methods
### `init(horizontal:spacing:)`

Initialize a box.
- Parameters:
  - horizontal: Whether the box is horizontal.
  - spacing: The spacing between the single elements.

### `insert(_:at:)`

Insert a widget into the box.
- Parameters:
  - widget: The widget.
  - index: The index.
- Returns: The box.

### `append(_:)`

Add a widget to the end of the box.
- Parameter widget: The widget.
- Returns: The box.

### `prepend(_:)`

Add a widget to the start of the box.
- Parameter widget: The widget.
- Returns: The box.

### `removeAll()`

Remove all widgets from the box.
- Returns: The box.

### `removeWidgets(_:)`

Remove certain widgets from the box.
- Parameter widgets: The widgets to remove.
- Returns: The box.

### `getContent()`

Get the content of the box.
- Returns: The widgets in the box.
