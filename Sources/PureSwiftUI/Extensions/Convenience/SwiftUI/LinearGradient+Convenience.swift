//
//  LinearGradient+Convenience.swift
//  
//
//  Created by Adam Fordyce on 17/02/2020.
//

import SwiftUI

public extension LinearGradient {
    
    @_optimize(none) init(_ colors: [Color], from: UnitPoint, to: UnitPoint) {
        
        self.init(gradient: Gradient(colors: colors), startPoint: from, endPoint: to)
    }
    
    @_optimize(none) init(_ colors: [Color], to: UnitPoint) {
    
        let from = UnitPoint(1 - to.x, 1 - to.y)
        self.init(colors, from: from, to: to)
    }
    
    @_optimize(none) init(_ colors: [Color], from: UnitPoint) {
    
        let to = UnitPoint(1 - from.x, 1 - from.y)
        self.init(colors, from: from, to: to)
    }
    
    @_optimize(none) init(_ colors: [Color], angle: Angle) {
        let to = angle.asUnitPoint
        self.init(gradient: Gradient(colors: colors), startPoint: to.inverted(), endPoint: to)
    }
}
