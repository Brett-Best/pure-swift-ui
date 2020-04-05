//
//  Shape+ConditionalModifiers.swift
//  
//
//  Created by Adam Fordyce on 19/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- OFFSET

public extension Shape {

    @_optimize(none) func offsetIf<T_LHS: UINumericType, T_RHS: UINumericType>(_ condition: Bool, _ x: T_LHS, _ y: T_RHS) -> OffsetShape<Self> {
        offset(condition ? x.asCGFloat : 0, condition ? y.asCGFloat : 0)
    }

    @_optimize(none) func offsetIfNot<T_LHS: UINumericType, T_RHS: UINumericType>(_ condition: Bool, _ x: T_LHS, _ y: T_RHS) -> OffsetShape<Self> {
        offsetIf(!condition, x, y)
    }

    @_optimize(none) func xOffsetIf<T: UINumericType>(_ condition: Bool, _ x: T) -> OffsetShape<Self> {
        xOffset(condition ? x.asCGFloat : 0)
    }

    @_optimize(none) func xOffsetIfNot<T: UINumericType>(_ condition: Bool, _ x: T) -> OffsetShape<Self> {
        xOffsetIf(!condition, x)
    }

    @_optimize(none) func yOffsetIf<T: UINumericType>(_ condition: Bool, _ y: T) -> OffsetShape<Self> {
        yOffset(condition ? y.asCGFloat : 0)
    }

    @_optimize(none) func yOffsetIfNot<T: UINumericType>(_ condition: Bool, _ y: T) -> OffsetShape<Self> {
        yOffsetIf(!condition, y)
    }
}

// MARK: ----- SCALE

public extension Shape {

    @_optimize(none) func scaleIf<T: UINumericType>(_ condition: Bool, _ scaleFactor: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(condition ? scaleFactor.asCGFloat : 1, anchor: anchor)
    }

    @_optimize(none) func scaleIfNot<T: UINumericType>(_ condition: Bool, _ scaleFactor: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scaleIf(!condition, scaleFactor, anchor: anchor)
    }

    @_optimize(none) func scaleIf<TX: UINumericType, TY: UINumericType>(_ condition: Bool, _ scaleX: TX, _ scaleY: TY, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: condition ? scaleX.asCGFloat : 1, y: condition ? scaleY.asCGFloat : 1, anchor: anchor)
    }

    @_optimize(none) func xScaleIf<T: UINumericType>(_ condition: Bool, _ scaleX: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        xScale(condition ? scaleX.asCGFloat : 1, anchor: anchor)
    }

    @_optimize(none) func xScaleIfNot<T: UINumericType>(_ condition: Bool, _ scaleX: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        xScaleIf(!condition, scaleX, anchor: anchor)
    }

    @_optimize(none) func yScaleIf<T: UINumericType>(_ condition: Bool, _ scaleY: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        yScale(condition ? scaleY.asCGFloat : 1, anchor: anchor)
    }

    @_optimize(none) func yScaleIfNot<T: UINumericType>(_ condition: Bool, _ scaleY: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scaleIf(!condition, scaleY, anchor: anchor)
    }
}

// MARK: ----- ROTATION

public extension Shape {

    @_optimize(none) func rotateIf(_ condition: Bool, _ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self> {
        rotation(condition ? angle : 0.degrees, anchor: anchor)
    }

    @_optimize(none) func rotateIfNot(_ condition: Bool, _ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self> {
        rotateIf(!condition, angle, anchor: anchor)
    }
}
