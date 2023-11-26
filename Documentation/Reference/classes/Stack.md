**CLASS**

# `Stack`

Gtk.Stack

## Properties
### `peers`

The content widgets and their assigned transitions.

### `activePeer`

The active content widget and its assigned transition.

## Methods
### `init()`

Initialize a stack widget.

### `append(_:transition:)`

Add a widget to a stack view.
- Parameters:
  - child: The wiget.
  - transition: The assigned transition.
- Returns: The stack view.

### `setVisible(_:transition:)`

Set the visible widget.
- Parameters:
  - child: The visible widget.
  - transition: A transition for overriding the default one.

### `removeAll()`

Remove all widgets.
- Returns: The stack.

### `removeWidgets(_:)`

Remove certain widgets.
- Parameter widgets: The widgets.
- Returns: The stack.

### `getContent()`

Get the content widgets and their transition.
- Returns: The content widgets and their transition.

### `getVisible()`

Get the visible widget and its transition.
- Returns: The visible widget and its transition.
