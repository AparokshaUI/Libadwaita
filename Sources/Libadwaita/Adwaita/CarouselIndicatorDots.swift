//
//  CarouselIndicatorDots.swift
//  Libadwaita
//
//  Created by david-swift on 26.11.23.
//

import CGTUI

/// Adw.CarouselIndicatorDots
public class CarouselIndicatorDots: NativeWidgetPeer {

    /// Initialize the indicator dots.
    /// - Parameter carousel: The carousel.
    public init(carousel: Carousel) {
        super.init()
        self.nativePtr = gtui_create_carouselindicatordots(carousel.nativePtr)
    }
}
