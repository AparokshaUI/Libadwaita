//
//  TitleBarWidget.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI
import Foundation

/// Adw.TitleBarWidget
public class TitleBarWidget: NativeWidgetPeer {

    /// Initialize a title bar widget.
    /// - Parameters:
    ///   - title: The widget's title.
    ///   - subtitle: The widget's subtitle.
    public init(_ title: String, _ subtitle: String) {
        super.init()
        self.nativePtr = gtui_create_title_bar_widget(title.cString, subtitle.cString)
    }
}
