//
//  SnappingSlider.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-20.
//

import Foundation
import UIKit

class SnappingSlider : UISlider {
    override var value: Float {
        set { super.value = newValue }
        get {
            return round(super.value * 60.0) / 60.0
        }
    }
}
