**CLASS**

# `NavigationView`

Adw.NavigationView

## Properties
### `peers`

The views in the navigation view.

## Methods
### `init()`

Initilaize a navigation view.

### `add(_:title:)`

Add a view to the navigaiton view.
- Parameters:
  - widget: The view.
  - title: The view's title.
- Returns: The navigation view.

### `pop()`

Remove the last widget of the navigation view.
- Returns: The navigation view.

### `removeAll()`

Remove all widgets.
- Returns: The navigation view.

### `removeWidgets(_:pop:)`

Remove widgets with certain IDs.
- Parameters:
  - widgets: The IDs.
  - pop: Whether to pop.
- Returns: The navigation view.

### `getContent()`

Get the content widgets' identifiers.
- Returns: The identifiers.
