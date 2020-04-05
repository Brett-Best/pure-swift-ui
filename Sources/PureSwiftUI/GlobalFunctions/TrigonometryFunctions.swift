//
//  TrigonometryFunctions.swift
//  
//
//  Created by Adam Fordyce on 20/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

@_optimize(none) public func cos(_ angle: Angle) -> Double {
    cos(angle.radians)
}

@_optimize(none) public func sin(_ angle: Angle) -> Double {
    sin(angle.radians)
}

@_optimize(none) public func tan(_ angle: Angle) -> Double {
    tan(angle.radians)
}
