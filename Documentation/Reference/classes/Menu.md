**CLASS**

# `Menu`

Gtk.Menu

## Properties
### `labels`

The labels of the components of the menu.

## Methods
### `init()`

Initialize a menu.

### `initAction(_:app:win:id:shortcut:handler:)`

Initialize an action.
- Parameters:
  - label: The action's label.
  - app: The application.
  - win: The application window.
  - id: The action's identifier.
  - shortcut: The action's keyboard shortcut.
  - handler: The action's handler.
- Returns: The action's identifier.

### `append(_:id:)`

Add a button to the end.
- Parameters:
  - label: The button's label.
  - id: The action's id.
- Returns: The menu.

### `append(_:app:shortcut:handler:)`

Add a button to the end.
- Parameters:
  - label: The button's label.
  - app: The application.
  - shortcut: The button's keyboard shortcut.
  - handler: The button's action handler.
- Returns: The menu.

### `append(_:window:shortcut:handler:)`

Add a button to the end.
- Parameters:
  - label: The button's label.
  - window: The application window.
  - shortcut: The button's keyboard shortcut.
  - handler: The button's action handler.
- Returns: The menu.

### `prepend(_:id:)`

Add a button to the start.
- Parameters:
  - label: The button's label.
  - id: The action's id.
- Returns: The menu.

### `prepend(_:app:shortcut:handler:)`

Add a button to the start.
- Parameters:
  - label: The button's label.
  - app: The application.
  - shortcut: The button's keyboard shortcut.
  - handler: The button's action handler.
- Returns: The menu.

### `prepend(_:window:shortcut:handler:)`

Add a button to the start.
- Parameters:
  - label: The button's label.
  - window: The application window.
  - shortcut: The button's keyboard shortcut.
  - handler: The button's action handler.
- Returns: The menu.

### `append(_:section:)`

Add a section to the end.
- Parameters:
  - label: The section's label.
  - section: The section.
- Returns: The menu.

### `prepend(_:section:)`

Add a section to the start.
- Parameters:
  - label: The section's label.
  - section: The section.
- Returns: The menu.

### `append(_:submenu:)`

Add a child menu to the end.
- Parameters:
  - label: The child menu's label.
  - submenu: The child menu.
- Returns: The parent menu.

### `prepend(_:submenu:)`

Add a child menu to the start.
- Parameters:
  - label: The child menu's label.
  - submenu: The child menu.
- Returns: The parent menu.

### `remove(at:)`

Remove the menu item at a certain position.
- Parameter position: The index.

### `remove(_:)`

Remove the menu item with a certain label.
- Parameter label: The label.
