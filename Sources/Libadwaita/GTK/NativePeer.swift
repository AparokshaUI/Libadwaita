//
//  NativePeer.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI
import Foundation

/// A component with a native pointer.
open class NativePeer {

    /// The native pointer.
    public var nativePtr: UInt64 = 0
    /// Additional information about the object.
    public var fields: [String: Any] = [:]

    /// Get the URL to the directory for storing data.
    /// - Returns: The URL.
    public static func getUserDataDirectory() -> URL {
        .init(fileURLWithPath: .init(cString: gtui_get_user_data_dir()), isDirectory: true)
    }

}
