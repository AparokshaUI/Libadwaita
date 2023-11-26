**CLASS**

# `MenuButton`

Gtk.MenuButton

## Properties
### `content`

The button's label, if it is not a simple text button.

### `menu`

The button's menu.

## Methods
### `init(_:)`

Initialize a menu button.
- Parameter label: The button's label.

### `init(_:icon:)`

Initialize a menu button.
- Parameters:
  - label: The button's label.
  - icon: The button's icon.

### `setLabel(_:)`

Set the menu button's label if it is a simple text button.
- Parameter text: The new label.

### `getContent()`

Get the button's content.
- Returns: The button's content.

### `getMenu()`

Get the button's menu.
- Returns: The button's menu.

### `menu(edit:)`

Modify the button's menu.
- Parameter edit: Modify the menu.
- Returns: The menu button.

### `menu(_:)`

Set a new menu for the menu button.
- Parameter menu: The new menu.
- Returns: The menu button.
