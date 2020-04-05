//
//  GeometryFunctions.swift
//  
//
//  Created by Adam Fordyce on 28/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

@available(*, deprecated, renamed: "calcXOffset", message: "Zero degrees moved from 3 o'clock to 12 o'clock")
@_optimize(none) public func xFromAngle<T: UINumericType>(_ angle: Angle, forRadius radius: T) -> CGFloat {
    calcXOffset(radius: radius, angle: angle)
}

@available(*, deprecated, renamed: "calcYOffset", message: "Zero degrees moved from 3 o'clock to 12 o'clock")
@_optimize(none) public func yFromAngle<T: UINumericType>(_ angle: Angle, forRadius radius: T) -> CGFloat {
    calcYOffset(radius: radius, angle: angle)
}

@available(*, deprecated, renamed: "calcOffset", message: "Zero degrees moved from 3 o'clock to 12 o'clock")
@_optimize(none) public func offsetFromAngle<T: UINumericType>(_ angle: Angle, forRadius radius: T) -> CGPoint {
    calcOffset(radius: radius, angle: angle)
}

@_optimize(none) public func calcXOffset<T: UINumericType>(radius: T, angle: Angle) -> CGFloat {
    (angle.sin * abs(radius.asCGFloat)).asCGFloat
}

@_optimize(none) public func calcYOffset<T: UINumericType>(radius: T, angle: Angle) -> CGFloat {
    (angle.cos * abs(radius.asCGFloat) * -1).asCGFloat
}

@_optimize(none) public func calcOffset<T: UINumericType>(radius: T, angle: Angle) -> CGPoint {
    let absRadius = abs(radius.asCGFloat)
    let xOffset = absRadius * angle.sin
    let yOffset = absRadius * angle.cos *  -1
    return CGPoint(xOffset, yOffset)
}
