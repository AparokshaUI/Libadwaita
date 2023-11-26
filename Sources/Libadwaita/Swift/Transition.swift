//
//  Transition.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

/// A transition for a stack.
public enum Transition: Int {

    // swiftlint:disable missing_docs discouraged_none_name
    case none
    case crossfade
    case slideRight, slideLeft, slideUp, slideDown, slideLeftRight, slideUpDown
    case coverUp, coverDown, coverLeft, coverRight
    case uncoverUp, uncoverDown, uncoverLeft, uncoverRight
    case coverUpDown, coverDownUp, coverLeftRight, coverRightLeft
    case rotateLeft, rotateRight, rotateLeftRight
    // swiftlint:enable missing_docs discouraged_none_name
}
