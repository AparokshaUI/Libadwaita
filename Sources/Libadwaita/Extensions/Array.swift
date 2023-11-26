//
//  Array.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import Foundation

extension Array where Element == String {

    /// A representation of the array for C.
    var cArray: UnsafeMutablePointer<UnsafePointer<CChar>?> {
        var cStringPointers: [UnsafePointer<CChar>?] = []
        for string in self {
            let cString = strdup(string)
            cStringPointers.append(cString)
        }
        var result: UnsafeMutablePointer<UnsafePointer<CChar>?>?
        cStringPointers.append(nil)
        cStringPointers.withUnsafeMutableBytes { bufferPtr in
            result = bufferPtr.bindMemory(to: UnsafePointer<CChar>?.self).baseAddress
        }
        // swiftlint:disable force_unwrapping
        return result!
        // swiftlint:enable force_unwrapping
    }
}
