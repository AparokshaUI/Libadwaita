//
//  Stack.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Gtk.Stack
public class Stack: NativeWidgetPeer {

    /// The content widgets and their assigned transitions.
    private var peers: [(NativeWidgetPeer, Transition)] = []
    /// The active content widget and its assigned transition.
    private var activePeer: (NativeWidgetPeer, Transition)? {
        get { peers.first }
        set {
            if let newValue {
                self.peers = self.peers.filter { $0.0.nativePtr != newValue.0.nativePtr }
                self.peers.insert(newValue, at: 0)
            }
        }
    }

    /// Initialize a stack widget.
    override public init() {
        super.init()
        self.nativePtr = gtui_create_stack()
    }

    /// Add a widget to a stack view.
    /// - Parameters:
    ///   - child: The wiget.
    ///   - transition: The assigned transition.
    /// - Returns: The stack view.
    public func append(_ child: NativeWidgetPeer, transition: Transition = .none) -> Stack {
        gtui_stack_add_child(self.nativePtr, child.nativePtr)
        peers.append((child, transition))
        return self
    }

    /// Set the visible widget.
    /// - Parameters:
    ///   - child: The visible widget.
    ///   - transition: A transition for overriding the default one.
    public func setVisible(_ child: NativeWidgetPeer, transition: Transition? = nil) {
        if let peer = peers.first(where: { $0.0.nativePtr == child.nativePtr }) {
            let transition = transition ?? peer.1
            gtui_stack_set_visible_child(self.nativePtr, child.nativePtr, transition.rawValue.cInt)
            self.activePeer = peer
        }
    }

    /// Remove all widgets.
    /// - Returns: The stack.
    public func removeAll() -> Self { removeWidgets(self.peers.map { $0.0 }) }

    /// Remove certain widgets.
    /// - Parameter widgets: The widgets.
    /// - Returns: The stack.
    public func removeWidgets(_ widgets: [NativeWidgetPeer]) -> Self {
        for peer in widgets {
            gtui_stack_remove(self.nativePtr, peer.nativePtr)
            self.peers = self.peers.filter { $0.0.nativePtr != peer.nativePtr }
        }
        return self
    }

    /// Get the content widgets and their transition.
    /// - Returns: The content widgets and their transition.
    public func getContent() -> [(NativeWidgetPeer, Transition?)] { peers }

    /// Get the visible widget and its transition.
    /// - Returns: The visible widget and its transition.
    public func getVisible() -> (NativeWidgetPeer, Transition)? { activePeer }
}
