**CLASS**

# `Application`

Adw.Application

## Properties
### `handlers`

Handlers for actions.

## Methods
### `init(name:)`

Initialize an application.
- Parameter name: The application's name.

### `onActivate()`

Run when the application opens.

### `addKeyboardShortcut(_:id:handler:)`

Add a keyboard shortcut.
- Parameters:
  - shortcut: The keyboard shortcut.
  - id: The action's identifier.
  - handler: The action's handler.

### `run()`

Execute the application.

### `quit()`

Quit the application.

### `getActiveWindow()`

Get the application's active window.
- Returns: The identifier of the active window.
