//
//  Bool.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import Foundation

extension Bool {

    /// A representation of the boolean for C.
    var cBool: Int32 { self ? 1 : 0 }
}
