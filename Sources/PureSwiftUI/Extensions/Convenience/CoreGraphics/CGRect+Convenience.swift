//
//  CGRect+Convenience.swift
//  
//
//  Created by Adam Fordyce on 11/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

// MARK: ----- INIT

public extension CGRect {
    
    @_optimize(none) init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(origin: CGPoint(x, y), size: CGSize(width, height))
    }
    
    @_optimize(none) init<TX: UINumericType, TY: UINumericType, TW: UINumericType, TH: UINumericType>(_ x: TX, _ y: TY, _ width: TW, _ height: TH) {
        self.init(x.asCGFloat, y.asCGFloat, width.asCGFloat, height.asCGFloat)
    }

    @_optimize(none) init(_ width: CGFloat, _ height: CGFloat) {
        self.init(0, 0, width, height)
    }
    
    @_optimize(none) init<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH) {
        self.init(width.asCGFloat, height.asCGFloat)
    }
    
    @_optimize(none) init(_ origin: CGPoint, _ size: CGSize) {
        self.init(origin.x, origin.y, size.width, size.height)
    }
}

// MARK: ----- INIT WITH ANCHOR

public extension CGRect {
    
    @_optimize(none) init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat, anchor: UnitPoint) {
        let size = CGSize(width, height)
        self.init(origin: CGPoint(x, y).offset(in: size, anchor: anchor), size: CGSize(width, height))
    }
    
    @_optimize(none) init<TX: UINumericType, TY: UINumericType, TW: UINumericType, TH: UINumericType>(_ x: TX, _ y: TY, _ width: TW, _ height: TH, anchor: UnitPoint) {
        self.init(x.asCGFloat, y.asCGFloat, width.asCGFloat, height.asCGFloat, anchor: anchor)
    }

    @_optimize(none) init(_ width: CGFloat, _ height: CGFloat, anchor: UnitPoint) {
        self.init(0, 0, width, height, anchor: anchor)
    }
    
    @_optimize(none) init<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, anchor: UnitPoint) {
        self.init(width.asCGFloat, height.asCGFloat, anchor: anchor)
    }
    
    @_optimize(none) init(_ origin: CGPoint, _ size: CGSize, anchor: UnitPoint) {
        self.init(origin.x, origin.y, size.width, size.height, anchor: anchor)
    }
}

// MARK: ----- INIT FROM TO POINT

public extension CGRect {
    
    @_optimize(none) init(from: CGPoint, to: CGPoint) {
        let origin = CGPoint(min(from.x, to.x), min(from.y, to.y))
        let size = CGSize(abs(from.x - to.x), abs(from.y - to.y))
        self.init(origin, size)
    }
}

// MARK: ----- STATIC INITIALISERS

public extension CGRect {
    
    @_optimize(none) static func rect(_ origin: CGPoint, _ size: CGSize) -> CGRect {
        .init(origin, size)
    }
    
    @_optimize(none) static func rect<TX: UINumericType, TY: UINumericType, TW: UINumericType, TH: UINumericType>(_ x: TX, _ y: TY, _ width: TW, _ height: TH) -> CGRect {
        .init(x, y, width, height)
    }
}

// MARK: ----- PROPERTIES

public extension CGRect {

    var center: CGPoint {
        .init(halfWidth + origin.x, halfHeight + origin.y)
    }
    
    var topLeading: CGPoint {
        origin
    }
    
    var top: CGPoint {
        CGPoint(midX, minY)
    }
    
    var topTrailing: CGPoint {
        CGPoint(maxX, minY)
    }

    var leading: CGPoint {
        CGPoint(minX, midY)
    }
    
    var trailing: CGPoint {
        CGPoint(maxX, midY)
    }
    
    var bottomLeading: CGPoint {
        CGPoint(minX, maxY)
    }
    
    var bottom: CGPoint {
        CGPoint(midX, maxY)
    }
    
    var bottomTrailing: CGPoint {
        CGPoint(maxX, maxY)
    }

    /**
     alias for bottomTrailing
     */
    var extent: CGPoint {
        bottomTrailing
    }
    
    var halfWidth: CGFloat {
        size.halfWidth
    }
    
    var halfHeight: CGFloat {
        size.halfHeight
    }
    
    var minDimension: CGFloat {
        size.minDimension
    }

    var maxDimension: CGFloat {
        size.maxDimension
    }

    @_optimize(none) func clampedSize<T_FROM: UINumericType, T_TO: UINumericType>(from: T_FROM, to: T_TO) -> CGSize {
        clampedSize(from: from.asCGFloat, to: to.asCGFloat)
    }
    
    @_optimize(none) func clampedSize(from: CGFloat, to: CGFloat) -> CGSize {
        .init(self.width.clamped(from: from, to: to), self.height.clamped(from: from, to: to))
    }
    
    @_optimize(none) func widthScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        width * scale.asCGFloat
    }
    
    @_optimize(none) func heightScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        height * scale.asCGFloat
    }
}

// MARK: ----- SCALED

public extension CGRect {
    
    @_optimize(none) func xScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        minX + widthScaled(scale)
    }

    @_optimize(none) func yScaled<T: UINumericType>(_ scale: T) -> CGFloat {
        minY + heightScaled(scale)
    }

    @_optimize(none) func sizeScaled(_ scale: CGPoint) -> CGSize {
        CGSize(widthScaled(scale.x), heightScaled(scale.y))
    }
    
    @_optimize(none) func sizeScaled(_ scale: CGVector) -> CGSize {
        CGSize(widthScaled(scale.dx), heightScaled(scale.dy))
    }
    
    @_optimize(none) func sizeScaled(_ scale: CGSize) -> CGSize {
        CGSize(widthScaled(scale.width), heightScaled(scale.height))
    }
    
    @_optimize(none) func sizeScaled<T: UINumericType>(_ scale: T) -> CGSize {
        CGSize(widthScaled(scale), heightScaled(scale))
    }
    
    @_optimize(none) func sizeScaled<TX: UINumericType, TY: UINumericType>(_ xScale: TX, _ yScale: TY) -> CGSize {
        CGSize(widthScaled(xScale), heightScaled(yScale))
    }
}

// MARK: ----- INSET

public extension CGRect {
    
    @_optimize(none) func inset(_ top: CGFloat, _ leading: CGFloat, _ bottom: CGFloat, _ trailing: CGFloat) -> CGRect {
        inset(by: UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing))
    }

    @_optimize(none) func inset<T_TOP: UINumericType, T_LEADING: UINumericType, T_BOTTOM: UINumericType, T_TRAILING: UINumericType>(_ top: T_TOP, _ leading: T_LEADING, _ bottom: T_BOTTOM, _ trailing: T_TRAILING) -> CGRect {
        inset(top.asCGFloat, leading.asCGFloat, bottom.asCGFloat, trailing.asCGFloat)
    }

    @_optimize(none) func inset<T: UINumericType>(_ edges: Edge.Set, _ size: T) -> CGRect {
        inset(edges, size.asCGFloat)
    }

    @_optimize(none) func inset(_ edges: Edge.Set, _ size: CGFloat) -> CGRect {
        inset(edges.inset(.top, size), edges.inset(.leading, size), edges.inset(.bottom, size), edges.inset(.trailing, size))
    }

    @_optimize(none) func insetTop(_ size: CGFloat) -> CGRect {
        inset(size, 0, 0, 0)
    }
    
    @_optimize(none) func insetTop<T: UINumericType>(_ size: T) -> CGRect {
        insetTop(size.asCGFloat)
    }
    
    @_optimize(none) func insetLeading(_ size: CGFloat) -> CGRect {
        inset(0, size, 0, 0)
    }

    @_optimize(none) func insetLeading<T: UINumericType>(_ size: T) -> CGRect {
        insetLeading(size.asCGFloat)
    }

    @_optimize(none) func insetBottom(_ size: CGFloat) -> CGRect {
        inset(0, 0, size, 0)
    }

    @_optimize(none) func insetBottom<T: UINumericType>(_ size: T) -> CGRect {
        insetBottom(size.asCGFloat)
    }

    @_optimize(none) func insetTrailing(_ size: CGFloat) -> CGRect {
        inset(0, 0, 0, size)
    }

    @_optimize(none) func insetTrailing<T: UINumericType>(_ size: T) -> CGRect {
        insetTrailing(size.asCGFloat)
    }

    @_optimize(none) func hInset(_ size: CGFloat) -> CGRect {
        inset(0, size, 0, size)
    }
    
    @_optimize(none) func hInset<T: UINumericType>(_ size: T) -> CGRect {
        hInset(size.asCGFloat)
    }
    
    @_optimize(none) func vInset(_ size: CGFloat) -> CGRect {
        inset(size, 0, size, 0)
    }
    
    @_optimize(none) func vInset<T: UINumericType>(_ size: T) -> CGRect {
        vInset(size.asCGFloat)
    }
    
    @_optimize(none) func inset(_ size: CGFloat) -> CGRect {
        inset(size, size, size, size)
    }

    @_optimize(none) func inset<T: UINumericType>(_ size: T) -> CGRect {
        inset(size.asCGFloat)
    }
}

// MARK: ----- REGION

public extension CGRect {

    @_optimize(none) func scaled(_ scale: CGSize, at location: CGPoint, anchor: UnitPoint = .topLeading) -> CGRect {
        CGRect(location, sizeScaled(scale), anchor: anchor)
    }

    @_optimize(none) func scaled<T: UINumericType>(_ scale: T, at location: CGPoint, anchor: UnitPoint = .topLeading) -> CGRect {
        scaled(.square(scale), at: location, anchor: anchor)
    }

    @_optimize(none) func xScaled<T: UINumericType>(_ scale: T, at location: CGPoint, anchor: UnitPoint = .topLeading) -> CGRect {
        scaled(CGSize(scale, 1), at: location, anchor: anchor)
    }

    @_optimize(none) func yScaled<T: UINumericType>(_ scale: T, at location: CGPoint, anchor: UnitPoint = .topLeading) -> CGRect {
        scaled(CGSize(1, scale), at: location, anchor: anchor)
    }
}

// MARK: ----- OFFSET

public extension CGRect {
    
    @_optimize(none) func offset(anchor: UnitPoint) -> CGRect {
        CGRect(self.origin.offset(in: size, anchor: anchor), size)
    }
    
    @_optimize(none) func offset<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> CGRect {
        offsetBy(dx: x.asCGFloat, dy: y.asCGFloat)
    }
    
    @_optimize(none) func offset(_ point: CGPoint) -> CGRect {
        offset(point.x, point.y)
    }
    
    @_optimize(none) func offset(_ point: CGSize) -> CGRect {
        offset(point.width, point.height)
    }
    
    @_optimize(none) func offset(_ point: CGVector) -> CGRect {
        offset(point.dx, point.dy)
    }

    @_optimize(none) func xOffset<T: UINumericType>(_ x: T) -> CGRect {
        offset(x, 0)
    }

    @_optimize(none) func yOffset<T: UINumericType>(_ y: T) -> CGRect {
        offset(0, y)
    }
}

// MARK: ----- OFFSET SCALED

public extension CGRect {
    
    @_optimize(none) func offset<T: UINumericType>(anchor: UnitPoint, factor: T) -> CGRect {
        CGRect(self.origin.offset(in: size, anchor: anchor, factor: factor), size)
    }
    
    @_optimize(none) func offset(anchor: UnitPoint, factor: CGSize) -> CGRect {
        CGRect(self.origin.offset(in: size, anchor: anchor, factor: factor), size)
    }
    
    @_optimize(none) func offset<TX: UINumericType, TY: UINumericType, TS: UINumericType>(_ x: TX, _ y: TY, factor: TS) -> CGRect {
        offset(x.asCGFloat * factor.asCGFloat, y.asCGFloat * factor.asCGFloat)
    }
    
    @_optimize(none) func offset<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY, factor: CGSize) -> CGRect {
        offset(x.asCGFloat * factor.x, y.asCGFloat * factor.y)
    }
    
    @_optimize(none) func offset<T: UINumericType>(_ point: CGPoint, factor: T) -> CGRect {
        offset(point.x, point.y, factor: factor)
    }
    
    @_optimize(none) func offset(_ point: CGPoint, factor: CGSize) -> CGRect {
        offset(point.x, point.y, factor: factor)
    }
    
    @_optimize(none) func offset<T: UINumericType>(_ point: CGSize, factor: T) -> CGRect {
        offset(point.width, point.height, factor: factor)
    }
    
    @_optimize(none) func offset(_ point: CGSize, factor: CGSize) -> CGRect {
        offset(point.width, point.height, factor: factor)
    }
    
    @_optimize(none) func offset<T: UINumericType>(_ point: CGVector, factor: T) -> CGRect {
        offset(point.dx, point.dy, factor: factor)
    }
    
    @_optimize(none) func offset(_ point: CGVector, factor: CGSize) -> CGRect {
        offset(point.dx, point.dy, factor: factor)
    }

    @_optimize(none) func xOffset<T: UINumericType, TS: UINumericType>(_ x: T, factor: TS) -> CGRect {
        offset(x, 0, factor: factor)
    }

    @_optimize(none) func yOffset<T: UINumericType, TS: UINumericType>(_ y: T, factor: TS) -> CGRect {
        offset(0, y, factor: factor)
    }
}
