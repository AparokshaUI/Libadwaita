//
//  InsertableContainer.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

/// A container with an additional `insert(_:at:)` function.
public protocol InsertableContainer: Container {

    /// Insert a widget at a certain index.
    /// - Parameters:
    ///   - widget: The widget.
    ///   - index: The index.
    /// - Returns: The container.
    func insert(_ widget: NativeWidgetPeer, at index: Int) -> Self

}
