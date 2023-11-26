//
//  Alignment.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

/// The alignment for a widget.
public enum Alignment: Int {

    /// The widget will fill the available space.
    case fill
    /// The widget will start at the beginning of the available space.
    case start
    /// The widget will end at the end of the available space.
    case end
    /// The widget will be centered in the available space.
    case center
    /// The widget will be baseline aligned in the available space.
    case baselineFill
    /// The widget will be baseline aligned at the start of the available space.
    case baselineCenter
}
