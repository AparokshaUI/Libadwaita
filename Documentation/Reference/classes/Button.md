**CLASS**

# `Button`

Gtk.Button

## Properties
### `handlers`

The action handlers.

### `content`

The button content, if there is no label set directly.

## Methods
### `init(_:)`

Initialize a button with a label.
- Parameter label: The label.

### `init()`

Initialize a button.

### `init(_:icon:)`

Initialize a button with an icon and optionally a label.
- Parameters:
  - label: The label.
  - icon: The icon.

### `initSignals()`

Initialize the button's signals.

### `handler(_:)`

Add a handler for the button.
- Parameter handler: The button's handler.
- Returns: The button.

### `setLabel(_:)`

Set the label for the button.
- Parameter text: The button's label.

### `getContent()`

Get the button content.
- Returns: The button content.

### `onClick()`

Run when the button gets clicked.
