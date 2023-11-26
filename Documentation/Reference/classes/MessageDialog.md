**CLASS**

# `MessageDialog`

Adw.MessageDialog

## Properties
### `handlers`

The handlers for the buttons.

## Methods
### `init(parent:heading:body:)`

Initialize a message dialog.
- Parameters:
  - parent: The parent window.
  - heading: The heading.
  - body: The body text.

### `response(id:label:appearance:enabled:type:handler:)`

Add a response button.
- Parameters:
  - id: The identifier.
  - label: The title.
  - appearance: The response appearance.
  - enabled: Whether it is enabled.
  - type: The response type.
  - handler: The handler for the response.
- Returns: The message dialog.

### `child(_:)`

Set the extra child widget.
- Parameter child: The child widget.
- Returns: The message dialog.

### `show()`

Show the message dialog.

### `close()`

Close the message dialog.

### `onClick(_:)`

Run when a button has been clicked.
- Parameter response: The response id.
