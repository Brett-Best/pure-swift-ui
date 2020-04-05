//
//  Shape+Modifiers.swift
//  
//
//  Created by Adam Fordyce on 18/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension Shape {
    
    @_optimize(none) func fillColor(_ color: Color, style: FillStyle = FillStyle()) -> some View {
        fill(color, style: style)
    }

    @_optimize(none) func strokeColor(_ color: Color) -> some View {
        stroke(color)
    }
    
    @_optimize(none) func strokeColor<T: UINumericType>(_ color: Color, lineWidth: T) -> some View {
        stroke(color, lineWidth: lineWidth.asCGFloat)
    }
    
    // named
    
    @_optimize(none) func fillColor(_ colorName: String, style: FillStyle = FillStyle()) -> some View {
        fill(Color(colorName), style: style)
    }

    @_optimize(none) func strokeColor(_ colorName: String) -> some View {
        stroke(Color(colorName))
    }
    
    @_optimize(none) func strokeColor<T: UINumericType>(_ colorName: String, lineWidth: T) -> some View {
        stroke(Color(colorName), lineWidth: lineWidth.asCGFloat)
    }
}

// MARK: ----- OFFSET

public extension Shape {
    
    @_optimize(none) func offset<T_LHS: UINumericType, T_RHS: UINumericType>(_ x: T_LHS, _ y: T_RHS) -> OffsetShape<Self> {
        offset(x: x.asCGFloat, y: y.asCGFloat)
    }
    
    @_optimize(none) func xOffset<T: UINumericType>(_ x: T) -> OffsetShape<Self> {
        offset(x: x.asCGFloat)
    }

    @_optimize(none) func yOffset<T: UINumericType>(_ y: T) -> OffsetShape<Self> {
        offset(y: y.asCGFloat)
    }
    
    //native
    @_optimize(none) func offset(_ x: CGFloat, _ y: CGFloat) -> OffsetShape<Self> {
        offset(x: x, y: y)
    }

    @_optimize(none) func xOffset(_ x: CGFloat) -> OffsetShape<Self> {
        offset(x: x)
    }

    @_optimize(none) func yOffset(_ y: CGFloat) -> OffsetShape<Self> {
        offset(y: y)
    }
    
    @_optimize(none) func offset(_ point: CGPoint) -> OffsetShape<Self> {
        offset(x: point.x, y: point.y)
    }
    
    @_optimize(none) func offset(_ size: CGSize) -> OffsetShape<Self> {
        offset(x: size.width, y: size.height)
    }
}

// MARK: ----- SCALE

public extension Shape {

    @_optimize(none) func scale<T: UINumericType>(_ scaleFactor: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(scaleFactor.asCGFloat, anchor: anchor)
    }
    
    @_optimize(none) func scale<TX: UINumericType, TY: UINumericType>(_ scaleX: TX, _ scaleY: TY, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleX.asCGFloat, y: scaleY.asCGFloat, anchor: anchor)
    }
    
    @_optimize(none) func xScale<T: UINumericType>(_ scaleX: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: scaleX.asCGFloat, y: 1, anchor: anchor)
    }
    
    @_optimize(none) func yScale<T: UINumericType>(_ scaleY: T, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: 1, y: scaleY.asCGFloat, anchor: anchor)
    }
}

// MARK: ----- ROTATION

public extension Shape {

    @_optimize(none) func rotate(_ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self> {
        rotation(angle, anchor: anchor)
    }
}

// MARK: ----- SIZE

public extension Shape {
    
    @_optimize(none) func size<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH) -> some Shape {
        size(width: width.asCGFloat, height: height.asCGFloat)
    }

    @_optimize(none) func size<T: UINumericType>(_ theSize: T) -> some Shape {
        size(theSize, theSize)
    }
}

// MARK: ----- STROKE

public extension Shape {
    
    @_optimize(none) func stroke<S: ShapeStyle, T: UINumericType>(_ content: S, lineWidth: T) -> some View {
        stroke(content, lineWidth: lineWidth.asCGFloat)
    }
}
