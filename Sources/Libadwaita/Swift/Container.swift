//
//  Container.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

/// The container protocol.
public protocol Container {

    /// Remove certain widgets.
    /// - Parameter widgets: The widgets.
    /// - Returns: The container.
    func removeWidgets(_ widgets: [NativeWidgetPeer]) -> Self

    /// Remove all widgets.
    /// - Returns: The container.
    func removeAll() -> Self

    /// Get the container's content.
    /// - Returns: The content.
    func getContent() -> [NativeWidgetPeer]

    /// Add a widget to the container's start.
    /// - Parameter widget: The widget.
    /// - Returns: The container.
    func prepend(_ widget: NativeWidgetPeer) -> Self

    /// Add a widget to the container's end.
    /// - Parameter widget: The widget.
    /// - Returns: The container.
    func append(_ widget: NativeWidgetPeer) -> Self

}
