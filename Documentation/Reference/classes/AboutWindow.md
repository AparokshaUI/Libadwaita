**CLASS**

# `AboutWindow`

Adw.AboutWindow

## Methods
### `init(parent:)`

Initialize an `AboutWindow`.
- Parameter parent: The parent window.

### `init(application:)`

Initialize an `AboutWindow`.
- Parameter application: The parent application.

### `generalData(title:icon:developer:version:)`

Set general data of the about window.
- Parameters:
  - title: The app title.
  - icon: The app icon.
  - developer: The app's developer.
  - version: The app version.
- Returns: The about window.

### `website(url:)`

Set the app's website.
- Parameter url: The URL.
- Returns: The about window.

### `support(url:)`

Set the app's support URL.
- Parameter url: The URL.
- Returns: The about window.

### `issue(url:)`

Set the app's issues URL.
- Parameter url: The URL.
- Returns: The about window.

### `addLink(title:url:)`

Add a custom link to the about window.
- Parameters:
  - title: The link's title.
  - url: The link's URL.
- Returns: The about window.

### `artists(_:)`

Set the artists.
- Parameter artists: The artists.
- Returns: The about window.

### `designers(_:)`

Set the designers.
- Parameter designers: The designers.
- Returns: The about window.

### `developers(_:)`

Set the developers.
- Parameter developers: The developers.
- Returns: The about window.

### `documenters(_:)`

Set the documenters.
- Parameter documenters: The documenters.
- Returns: The about window.

### `addCreditSection(title:people:)`

Add a custom credit section.
- Parameters:
  - title: The title.
  - people: The people.
- Returns: The about window.

### `copyright(_:)`

Set the copyright string.
- Parameter copyright: The copyright.
- Returns: The about window.

### `license(_:)`

Set the license type.
- Parameter license: The license type.
- Returns: The about window.
