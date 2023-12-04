**CLASS**

# `FileDialog`

Gtk.FileDialog

## Properties
### `window`

The parent window, if there is one.

### `selfAddr`

A link to the file dialog.

### `openClosure`

The closure that gets called when a file for opening has been selected.

### `saveClosure`

The closure that gets called when a file for saving has been selected.

### `closeClosure`

The closure that gets called when a dialog has been closed.

### `folders`

Whether folders are allowed when opening a file.

## Methods
### `init(_:)`

Initialize a file dialog.
- Parameter parent: The parent window.

### `setExtensions(_:folders:)`

Set the allowed file extensions for opening a file (e.g. `[".py"]`).
- Parameters:
    - extensions: The allowed extensions, or nil for allowing every type.
    - folders: Whether folders are allowed.

### `setInitialName(_:)`

Set the initial name of the file when saving it.
- Parameter name: The file's initial name.

### `open(folder:_:onClose:)`

Open the file dialog for opening a file.
- Parameters:
    - folder: The URL of the initial folder, or `nil` for the "Recent" view.
    - onOpen: Run this closure when a URL is available.
    - onClose: Run this closure when the user cancels the action.

### `save(folder:_:onClose:)`

Open the file dialog for saving a file.
- Parameters:
    - folder: The URL of the initial folder, or `nil` for the "Home" folder.
    - onSave: Run this closure when the file should be saved at a URL.
    - onClose: Run this closure when the user cancels the action.

### `onOpen(_:)`

Run this when a file gets opened.
- Parameter path: The file path.

### `onSave(_:)`

Run this when a file gets saved.
- Parameter path: The file path.

### `onClose()`

Run this when the user cancels the action.
