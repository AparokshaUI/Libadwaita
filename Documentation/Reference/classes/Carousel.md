**CLASS**

# `Carousel`

Adw.Carousel

## Properties
### `peers`

The identifiers of the content.

## Methods
### `init()`

Initialize a carousel.

### `append(_:)`

Add a widget to the end.
- Parameter widget: The widget.
- Returns: The carousel.

### `prepend(_:)`

Add a widget to the beginning.
- Parameter widget: The widget.
- Returns: The carousel.

### `insert(_:at:)`

Insert a widget at a certain index.
- Parameters:
  - widget: The widget.
  - index: The index.
- Returns: The carousel.

### `removeWidgets(_:)`

Remove certain widgets.
- Parameter widgets: The widgets.
- Returns: The carousel.

### `removeAll()`

Remove all widgets.
- Returns: The carousel.

### `getContent()`

Get the content widgets.
- Returns: The carousel.

### `longSwipes(_:)`

Allow swiping more than one page at a time.
- Parameter longSwipes: Allow long swiping.
- Returns: The carousel.

### `addIndicatorDots(top:)`

Add indicator dots to the carousel.
- Parameter top: Whether the dots should be at the top.
- Returns: The carousel and the dots.
