**CLASS**

# `TabOverview`

Adw.TabOverview

## Properties
### `handler`

A handler for when the "Create Tab" button gets pressed.

### `overviewPresented`

Whether the overview is visible.

## Methods
### `init()`

Initialize a tab overview.

### `add(_:view:)`

Add a child and a tab view.
- Parameters:
  - child: The child widget.
  - view: The tab view.
- Returns: The tab overview.

### `createTabHandler(_:)`

Set the handler for the "Create Tab" button.
- Parameter handler: The handler.
- Returns: The tab overview.

### `showOverview()`

Show the tab overview.

### `hideOverview()`

Hide the tab overview.

### `onCreateTab()`

Run when the "Create Tab" button gets pressed.
- Returns: The new tab.
