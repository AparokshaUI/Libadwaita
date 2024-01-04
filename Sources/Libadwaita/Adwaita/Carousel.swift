//
//  Carousel.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.Carousel
public class Carousel: NativeWidgetPeer, InsertableContainer {

    /// The identifiers of the content.
    private var peers: [NativeWidgetPeer] = []

    /// Initialize a carousel.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_carousel()
    }

    /// Add a widget to the end.
    /// - Parameter widget: The widget.
    /// - Returns: The carousel.
    public func append(_ widget: NativeWidgetPeer) -> Self {
        gtui_carousel_append(self.nativePtr, widget.nativePtr)
        self.peers.append(widget)
        return self
    }

    /// Add a widget to the beginning.
    /// - Parameter widget: The widget.
    /// - Returns: The carousel.
    public func prepend(_ widget: NativeWidgetPeer) -> Self {
        gtui_carousel_prepend(self.nativePtr, widget.nativePtr)
        self.peers.insert(widget, at: 0)
        return self
    }

    /// Insert a widget at a certain index.
    /// - Parameters:
    ///   - widget: The widget.
    ///   - index: The index.
    /// - Returns: The carousel.
    public func insert(_ widget: NativeWidgetPeer, at index: Int) -> Self {
        gtui_carousel_insert(self.nativePtr, widget.nativePtr, index.cInt)
        self.peers.insert(widget, at: index)
        return self
    }

    /// Remove certain widgets.
    /// - Parameter widgets: The widgets.
    /// - Returns: The carousel.
    public func removeWidgets(_ widgets: [NativeWidgetPeer]) -> Self {
        for widget in widgets {
            gtui_carousel_remove(self.nativePtr, widget.nativePtr)
            self.peers = self.peers.filter { $0.nativePtr != widget.nativePtr }
        }
        return self
    }

    /// Remove all widgets.
    /// - Returns: The carousel.
    public func removeAll() -> Self { removeWidgets(self.peers) }

    /// Get the content widgets.
    /// - Returns: The carousel.
    public func getContent() -> [NativeWidgetPeer] { self.peers }

    /// Allow swiping more than one page at a time.
    /// - Parameter longSwipes: Allow long swiping.
    /// - Returns: The carousel.
    public func longSwipes(_ longSwipes: Bool = true) -> Carousel {
        gtui_carousel_allow_long_swipes(self.nativePtr, longSwipes.cBool)
        return self
    }

    /// Add indicator dots to the carousel.
    /// - Parameter top: Whether the dots should be at the top.
    /// - Returns: The carousel and the dots.
    public func addIndicatorDots(top: Bool = false) -> Box {
        let box = Box(horizontal: false)
        let dots = CarouselIndicatorDots(carousel: self)
        if top { _ = box.append(dots).append(self) } else { _ = box.append(self).append(dots) }
        return box
    }
}
