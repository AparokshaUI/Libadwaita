**CLASS**

# `Window`

Adw.Window

## Properties
### `isMaximized`

Whether the window is maximized.

### `closeHandler`

The handler that gets called when the window is being closed.

## Methods
### `init(app:)`

Initialize a window.
- Parameter app: The parent application.

### `init(application:)`

Initialize a window.
- Parameter application: The parent application.

### `init()`

Initialize a window.

### `show()`

Show the window.

### `setChild(_:)`

Set the window's child widget.
- Parameter widget: The widget.

### `setParent(_:)`

Set the window's parent window.
- Parameter window: The parent window.

### `setTitle(_:)`

Set the window's title.
- Parameter title: The window title.

### `maximize()`

Maximize the window.

### `unmaximize()`

Unmaximize the window.

### `fullscreen()`

Enter fullscreen.

### `unfullscreen()`

Unfullscreen the window.

### `minimize()`

Minimize the window.

### `close()`

Close the window.

### `setDefaultSize(width:height:)`

Set the window's initial size.
- Parameters:
  - width: The window's width.
  - height: The window's height.

### `setResizability(_:)`

Set the window's resizability.
- Parameter resizable: Whether the window is resizable.

### `setDeletability(_:)`

Set the window's deletability.
- Parameter deletable: Whether the window is deletable.

### `observeHide(_:)`

Observe whether a window is being closed.
- Parameter run: The handler, returning whether the window should stay open.

### `onHide()`

Run when a window requests to get closed.
- Returns: Whether the window should stay open.

### `initSignals()`

Initialize the window's signals.
