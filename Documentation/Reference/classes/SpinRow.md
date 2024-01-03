**CLASS**

# `SpinRow`

Adw.SpinRow

## Properties
### `handler`

The handler for when the spin row's value changes.

## Methods
### `init(title:subtitle:min:max:step:)`

Initialize a spin row.
- Parameters:
  - title: The spin row's title.
  - subtitle: The spin row's subtitle.
  - min: The spin row's minimum value.
  - max: The spin row's maximum value.
  - step: The spin row's increase/decrease step.

### `init()`

Initialize a spin row.

### `configuration(min:max:step:)`

Set the configuration.
- Parameters:
  - min: The minimum value.
  - max: The maximum value.
  - step: The increase/decrease step.
- Returns: The spin row.

### `getValue()`

Get a spin row's value.
- Returns: The value.

### `setValue(_:)`

Set a spin row's value.
- Parameter value: The value.

### `onChange(handler:)`

Set the handler for when the value changes.
- Parameter handler: The handler.
- Returns: The spin row.
