//
//  MarkupLabel.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI
import Foundation

/// Gtk.Label
public class MarkupLabel: Label {

    /// Initialize a markup label.
    /// - Parameter text: The content.
    override public init(_ text: String) {
        super.init()
        self.nativePtr = gtui_create_markup_label(text.cString)
    }

}
