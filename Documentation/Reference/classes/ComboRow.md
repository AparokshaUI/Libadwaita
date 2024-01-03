**CLASS**

# `ComboRow`

Adw.ComboRow

## Properties
### `stringListPtr`

The identifier of the string list.

### `strings`

The content.

### `handler`

The handler gets called when the selection changes.

## Methods
### `init(title:subtitle:)`

Initialize a combo row.
- Parameters:
  - title: The row's title.
  - subtitle: The row's subtitle.

### `append(_:)`

Append a string.
- Parameter string: The string.
- Returns: The combo row.

### `remove(at:)`

Remove a string.
- Parameter index: The index.
- Returns: The combo row.

### `getContent()`

Get the string content.
- Returns: The content.

### `selected()`

Get the selected row.
- Returns: The string of the selected row.

### `select(at:)`

Set the selected row.
- Parameter index: The index of the new selection.

### `onChange(handler:)`

Set a handler for when the selection changes.
- Parameter handler: The handlers.
- Returns: The combo row.
