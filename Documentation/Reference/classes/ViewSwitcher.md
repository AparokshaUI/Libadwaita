**CLASS**

# `ViewSwitcher`

Adw.ViewSwitcher

## Properties
### `onSelect`

The closure that is executed when the selection changes.

## Methods
### `init()`

Initialize a view switcher.

### `addOption(title:icon:)`

Add a view.
- Parameters:
    - title: The view's title and identifier.
    - icon: The view's icon.
- Returns: The view switcher.

### `removeOption(title:)`

Remove a view.
- Parameter title: The view's title.
- Returns: The view switcher.

### `getSelection()`

Get the selected view's title.
- Returns: The title.

### `select(title:)`

Select the view with a specific title.
- Parameter title: The title.

### `onSelect(closure:)`

Set the closure that gets called when the selection changes.
- Parameter closure: The closure.
- Returns: The view switcher.

### `wideDesign(_:)`

Set the wide or narrow design.
- Parameter wide: Whether the design is wide.
- Returns: The view switcher.
