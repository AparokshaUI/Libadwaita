**CLASS**

# `EntryRow`

Adw.EntryRow

## Properties
### `handler`

The handlers for when the entry row gets submitted.

### `updateHandler`

The handler for when the entry row's text changes.

## Methods
### `init(title:)`

Initialize an entry row.
- Parameter title: The row's title.

### `init()`

Initialize an entry row.

### `addPrefix(_:)`

Add a prefix to the entry row.
- Parameter prefix: The prefix.
- Returns: The entry row.

### `addSuffix(_:)`

Add a suffix to the entry row.
- Parameter suffix: The suffix.
- Returns: The entry row.

### `submitHandler(_:)`

Add a submit handler to the entry row.
- Parameter handler: The handler.
- Returns: The entry row.

### `contents()`

Get the content of the entry row.
- Returns: The content.

### `setContents(_:)`

Set the content of the entry row.
- Parameter text: The new content.

### `changeHandler(_:)`

Observe updates in the written text.
- Parameter handler: The handler.
- Returns: The entry row.
