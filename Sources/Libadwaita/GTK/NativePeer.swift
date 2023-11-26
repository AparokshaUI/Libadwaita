//
//  NativePeer.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

/// A component with a native pointer.
open class NativePeer {

    /// The native pointer.
    public internal(set) var nativePtr: UInt64 = 0
    /// Additional information about the object.
    public var fields: [String: Any] = [:]
}
