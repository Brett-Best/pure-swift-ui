//
//  CGVector+Convenience.swift
//
//  Created by Adam Fordyce on 25/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

public extension CGVector {
    
    @_optimize(none) init(_ size: CGFloat) {
        self.init(size, size)
    }
    
    @_optimize(none) init<T: UINumericType>(_ size: T) {
        self.init(size.asCGFloat)
    }
    
    @_optimize(none) init(_ dx: CGFloat, _ dy: CGFloat) {
        self.init(dx: dx, dy: dy)
    }

    @_optimize(none) init<TX: UINumericType, TY: UINumericType>(_ dx: TX, _ dy: TY) {
        self.init(dx: dx.asCGFloat, dy: dy.asCGFloat)
    }

    var asCGRect: CGRect {
        CGRect(dx, dy)
    }
    
    var asCGPoint: CGPoint {
        CGPoint(dx, dy)
    }

    var asCGSize: CGSize {
        CGSize(dx, dy)
    }
    
    var asUnitPoint: UnitPoint {
        UnitPoint(dx, dy)
    }
    
    var width: CGFloat {
        dx
    }

    var height: CGFloat {
        dy
    }

    var midX: CGFloat {
        width * 0.5
    }

    var midY: CGFloat {
        height * 0.5
    }
    
    var halfWidth: CGFloat {
        midX
    }
    
    var halfHeight: CGFloat {
        midY
    }

    var minDimension: CGFloat {
        min(dx, dy)
    }

    var maxDimension: CGFloat {
        max(dx, dy)
    }
    
    @_optimize(none) func scaled<T: UINumericType>(_ scale: T) -> CGSize {
        scaled(.square(scale))
    }
    
    @_optimize(none) func scaled(_ scale: CGSize) -> CGSize {
        .init(widthScaled(scale.width), heightScaled(scale.height))
    }

    @_optimize(none) func widthScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        dx * scale.asCGFloat
    }

    @_optimize(none) func heightScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        dy * scale.asCGFloat
    }

    @_optimize(none) func clamped(from: CGFloat, to: CGFloat) -> CGVector {
        .init(dx.clamped(from: from, to: to), dy.clamped(from: from, to: to))
    }
}

// MARK: ----- STATIC INITIALISERS

public extension CGVector {
    
    @_optimize(none) static func dx<T: UINumericType>(_ dx: T) -> CGVector {
        .init(dx, 0)
    }
    
    @_optimize(none) static func dy<T: UINumericType>(_ dy: T) -> CGVector {
        .init(0, dy)
    }
    
    @_optimize(none) static func vector<TDX: UINumericType, TDY: UINumericType>(_ dx: TDX, _ dy: TDY) -> CGVector {
        .init(dx, dy)
    }
    
    @_optimize(none) static func vector<T: UINumericType>(_ size: T) -> CGVector {
        .init(size)
    }
}

// MARK: ----- OPERATOR OVERLOADS

public extension CGVector {
    
    @_optimize(none) static func -(lhs: CGVector, rhs: CGVector) -> CGVector {
        .init(lhs.dx - rhs.dx, lhs.dy - rhs.dy)
    }

    @_optimize(none) static func +(lhs: CGVector, rhs: CGVector) -> CGVector {
        .init(lhs.dx + rhs.dx, lhs.dy + rhs.dy)
    }
}
