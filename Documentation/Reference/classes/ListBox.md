**CLASS**

# `ListBox`

Gtk.ListBox

## Properties
### `peers`

The child widgets.

### `handlers`

Handlers for selecting rows.

## Methods
### `init()`

### `insert(_:at:)`

Insert a widget at an index.
- Parameters:
  - widget: The widget.
  - index: The index.
- Returns: The list box.

### `append(_:)`

Add a widget to the end of the list box.
- Parameter widget: The widget.
- Returns: The list box.

### `prepend(_:)`

Add a widget to the start of the list box.
- Parameter widget: The widget.
- Returns: The list box.

### `removeAll()`

Remove all the widgets from the list box.
- Returns: The list box.

### `removeWidgets(_:)`

Remove certain widgets from the list box.
- Parameter widgets: The widgets.
- Returns: The list box.

### `remove(at:)`

Remove the widget at a certain index from the list box.
- Parameter index: The index.
- Returns: The list box.

### `getContent()`

Get the content of the list box.
- Returns: The content.

### `selectRow(at:)`

Select the row at a certain index.
- Parameter index: The index.

### `getSelectedRow()`

Get the index of the selected row.
- Returns: The index.

### `sidebarStyle()`

Set the style of the list box to the sidebar style.
- Returns: The list box.

### `handler(_:)`

Add a handler for when the selection changes.
- Parameter handler: The handler.
- Returns: The list box.

### `onSelectRow()`

Run this function when a row gets selected.
