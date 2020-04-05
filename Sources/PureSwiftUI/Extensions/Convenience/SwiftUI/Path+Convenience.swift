//
//  Path+Convenience.swift
//  
//
//  Created by Adam Fordyce on 05/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI



// MARK: ----- NORMALISATION

public let rotationAdjustment = 90.degrees

@_optimize(none) public func adjustAngle(_ angle: Angle) -> Angle {
    angle - rotationAdjustment
}

// MARK: ----- UNCONSTRAINED MOVE

public extension Path {
    
    @_optimize(none) mutating func  move(_ point: CGPoint) {
        move(to: point)
    }
    
    @_optimize(none) mutating func  move<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) {
        move(x.asCGFloat, y.asCGFloat)
    }
    
    @_optimize(none) mutating func  move(_ x: CGFloat, _ y: CGFloat) {
        move(CGPoint(x: x, y: y))
    }
    
    @_optimize(none) mutating func  move(offset: CGPoint) {
        if let currentPoint = currentPoint {
            move(currentPoint.x + offset.x, currentPoint.y + offset.y)
        }
    }

    @_optimize(none) mutating func  move(offset: CGSize) {
        move(offset: offset.asCGPoint)
    }

    @_optimize(none) mutating func  move(offset: CGVector) {
        move(offset: offset.asCGPoint)
    }
}

// MARK: ----- CONSTRAINED MOVE IN X

public extension Path {

    // mMove
    @available(*, deprecated, renamed: "hMove")
    @_optimize(none) mutating func  move<T: UINumericType>(xOffset: T) {
        hMove(offset: xOffset.asCGFloat)
    }

    @_optimize(none) mutating func  hMove<T: UINumericType>(offset: T) {
        hMove(offset: offset.asCGFloat)
    }
    
    @available(*, deprecated, renamed: "hMove")
    @_optimize(none) mutating func  move(xOffset: CGFloat) {
        hMove(offset: xOffset)
    }

    @_optimize(none) mutating func  hMove(offset: CGFloat) {
        move(offset: CGPoint(offset, 0))
    }
}

// MARK: ----- CONSTRAINED MOVE TO X

public extension Path {
    
    @_optimize(none) mutating func  hMove(_ x: CGFloat) {
        if let currentPoint = currentPoint {
            move(x, currentPoint.y)
        }
    }
    
    @_optimize(none) mutating func  hMove(_ point: CGPoint) {
        hMove(point.x)
    }
}

// MARK: ----- CONSTRAINED MOVE IN Y

public extension Path {

    @available(*, deprecated, renamed: "hMove")
    @_optimize(none) mutating func  move<T: UINumericType>(yOffset: T) {
        vMove(offset: yOffset.asCGFloat)
    }
    
    @_optimize(none) mutating func  vMove<T: UINumericType>(offset: T) {
        vMove(offset: offset.asCGFloat)
    }
    
    @available(*, deprecated, renamed: "vMove")
    @_optimize(none) mutating func  move(yOffset: CGFloat) {
        vMove(offset: yOffset)
    }
    
    @_optimize(none) mutating func  vMove(offset: CGFloat) {
        move(offset: CGPoint(0, offset))
    }
}

// MARK: ----- CONSTRAINED MOVE TO Y

public extension Path {
        
    @_optimize(none) mutating func  vMove(_ y: CGFloat) {
        if let currentPoint = currentPoint {
            move(currentPoint.x, y)
        }
    }
    
    @_optimize(none) mutating func  vMove(_ point: CGPoint) {
        vMove(point.y)
    }
}

// MARK: ----- LINE

public extension Path {
    
    @_optimize(none) mutating func  line(_ point: CGPoint) {
        addLine(to: point)
    }
    
    @_optimize(none) mutating func  line(length: CGFloat, angle: Angle) {
        if let currentPoint = currentPoint {
            line(currentPoint.offset(radius: length, angle: angle))
        }
    }
    
    @_optimize(none) mutating func  line<T: UINumericType>(length: T, angle: Angle) {
        line(length: length.asCGFloat, angle: angle)
    }
    
    @_optimize(none) mutating func  line<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) {
        line(x.asCGFloat, y.asCGFloat)
    }
    
    @_optimize(none) mutating func  line(_ x: CGFloat, _ y: CGFloat) {
        line(CGPoint(x: x, y: y))
    }
    
    @_optimize(none) mutating func  lines(_ lines: [CGPoint]) {
        addLines(lines)
    }
    
    @_optimize(none) mutating func  line(offset: CGPoint) {
        if let currentPoint = currentPoint {
            line(currentPoint.x + offset.x, currentPoint.y + offset.y)
        }
    }
    
    @_optimize(none) mutating func  line(offset: CGSize) {
        line(offset: offset.asCGPoint)
    }

    @_optimize(none) mutating func  line(offset: CGVector) {
        line(offset: offset.asCGPoint)
    }
}

// MARK: ----- CONSTRAINED LINE IN X

public extension Path {

    @available(*, deprecated, renamed: "hLine")
    @_optimize(none) mutating func  line<T: UINumericType>(xOffset: T) {
        hLine(offset: xOffset)
    }

    @_optimize(none) mutating func  hLine<T: UINumericType>(offset: T) {
        line(offset: CGPoint(offset, 0))
    }
}

// MARK: ----- CONSTRAINED LINE TO X

public extension Path {
    
    @_optimize(none) mutating func  hLine<T: UINumericType>(_ x: T) {
        if let currentPoint = currentPoint {
            line(x, currentPoint.y)
        }
    }
    
    @_optimize(none) mutating func  hLine(_ point: CGPoint) {
        hLine(point.x)
    }
}

// MARK: ----- CONSTRAINED LINE IN Y

public extension Path {

    @available(*, deprecated, renamed: "vLine")
    @_optimize(none) mutating func  line<T: UINumericType>(yOffset: T) {
        vLine(offset: yOffset)
    }

    @_optimize(none) mutating func  vLine<T: UINumericType>(offset: T) {
        line(offset: CGPoint(0, offset))
    }
}

// MARK: ----- CONSTRAINED LINE TO Y

public extension Path {
    
    @_optimize(none) mutating func  vLine<T: UINumericType>(_ y: T) {
        if let currentPoint = currentPoint {
            line(currentPoint.x, y)
        }
    }
    
    @_optimize(none) mutating func  vLine(_ point: CGPoint) {
        vLine(point.y)
    }
}

// MARK: ----- LINE AT

public extension Path {
    
    @_optimize(none) mutating func  line(at location: CGPoint, vector: CGVector, anchor: UnitPoint = .topLeading) {
        let origin = location.offset(in: vector, anchor: anchor)
        move(origin)
        line(origin.offset(vector))
    }
    
    @_optimize(none) mutating func  hLine<T: UINumericType>(at location: CGPoint, length: T, anchor: UnitPoint = .topLeading) {
        line(at: location, vector: CGVector(length, 0), anchor: anchor)
    }
    
    @_optimize(none) mutating func  vLine<T: UINumericType>(at location: CGPoint, length: T, anchor: UnitPoint = .topLeading) {
        line(at: location, vector: CGVector(0, length), anchor: anchor)
    }
}

// MARK: ----- LINE AT WITH ANGLE

public extension Path {
    
    @_optimize(none) mutating func  line<T: UINumericType>(at location: CGPoint, length: T, angle: Angle, anchor: UnitPoint = .center) {
        let rotatedPoint = location.calcPoint(length: length, angle: angle)
        let delta = rotatedPoint - location
        let origin = location.offset(in: delta, anchor: anchor)
        line(from: origin, to: origin + delta)
    }
}

// MARK: ----- LINE FROM

public extension Path {
    
    @_optimize(none) mutating func  line(from: CGPoint, to: CGPoint) {
        move(from)
        line(to)
    }
}

// MARK: ----- LINE FROM WITH ANGLE

public extension Path {
    
    @_optimize(none) mutating func  line<T: UINumericType>(from: CGPoint, length: T, angle: Angle) {
        line(from: from, to: from.calcPoint(length: length, angle: angle))
    }
}

// MARK: ----- RECT

public extension Path {
    
    @_optimize(none) mutating func  rect(_ rect: CGRect, transform: CGAffineTransform = .identity) {
        addRect(rect, transform: transform)
    }
    
    @_optimize(none) mutating func  rect(_ origin: CGPoint, _ size: CGSize, transform: CGAffineTransform = .identity) {
        rect(CGRect(origin, size), transform: transform)
    }
    
    @_optimize(none) mutating func  rects(_ rects: [CGRect], transform: CGAffineTransform = .identity) {
        addRects(rects, transform: transform)
    }
}

// MARK: ----- RECT WITH ANCHOR

public extension Path {
    
    @_optimize(none) mutating func  rect(_ rect: CGRect, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        self.rect(rect.offset(anchor: anchor), transform: transform)
    }
    
    @_optimize(none) mutating func  rect(_ origin: CGPoint, _ size: CGSize, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        rect(CGRect(origin.offset(in: size, anchor: anchor), size), transform: transform)
    }
}

// MARK: ----- FROM POINT TO POINT

public extension Path {
    
    @_optimize(none) mutating func  rect(from: CGPoint, to: CGPoint, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        rect(CGRect(from: from, to: to), transform: transform)
    }
}

// MARK: ----- ROUNDED RECT WITH CORNER SIZE

public extension Path {
    
    @_optimize(none) mutating func  roundedRect(_ rect: CGRect, cornerSize: CGSize, transform: CGAffineTransform = .identity) {
        addRoundedRect(in: rect, cornerSize: cornerSize, transform: transform)
    }
    
    @_optimize(none) mutating func  roundedRect(_ origin: CGPoint, _ size: CGSize, cornerSize: CGSize, transform: CGAffineTransform = .identity) {
        roundedRect(CGRect(origin, size), cornerSize: cornerSize, transform: transform)
    }
}

// MARK: ----- ROUNDED RECT WITH CORNER RADIUS

public extension Path {
    
    @_optimize(none) mutating func  roundedRect<TR: UINumericType>(_ rect: CGRect, cornerRadius: TR, transform: CGAffineTransform = .identity) {
        addRoundedRect(in: rect, cornerSize: .square(cornerRadius), transform: transform)
    }
    
    @_optimize(none) mutating func  roundedRect<TR: UINumericType>(_ origin: CGPoint, _ size: CGSize, cornerRadius: TR, transform: CGAffineTransform = .identity) {
        roundedRect(CGRect(origin, size), cornerRadius: cornerRadius, transform: transform)
    }
}

// MARK: ----- ROUNDED RECT AT WITH CORNER SIZE

public extension Path {
    
    @_optimize(none) mutating func  roundedRect(_ rect: CGRect, cornerSize: CGSize, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        roundedRect(rect.offset(anchor: anchor), cornerSize: cornerSize, transform: transform)
    }
    
    @_optimize(none) mutating func  roundedRect(_ origin: CGPoint, _ size: CGSize, cornerSize: CGSize, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        roundedRect(CGRect(origin.offset(in: size, anchor: anchor), size), cornerSize: cornerSize, transform: transform)
    }
}

// MARK: ----- ROUNDED RECT AT WITH CORNER RADIUS AND ANCHOR

public extension Path {
    
    @_optimize(none) mutating func  roundedRect<TR: UINumericType>(_ rect: CGRect, cornerRadius: TR, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        roundedRect(rect.offset(anchor: anchor), cornerSize: .square(cornerRadius), transform: transform)
    }

    @_optimize(none) mutating func  roundedRect<TR: UINumericType>(_ origin: CGPoint, _ size: CGSize, cornerRadius: TR, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        roundedRect(CGRect(origin.offset(in: size, anchor: anchor), size), cornerSize: .square(cornerRadius), transform: transform)
    }
}

// MARK: ----- ELLIPSE

public extension Path {
    
    @_optimize(none) mutating func  ellipse(_ rect: CGRect, transform: CGAffineTransform = .identity) {
        addEllipse(in: rect, transform: transform)
    }
    
    @_optimize(none) mutating func  ellipse(_ origin: CGPoint, _ size: CGSize, transform: CGAffineTransform = .identity) {
        ellipse(CGRect(origin, size), transform: transform)
    }
}

// MARK: ----- ELLIPSE WITH ANCHOR

public extension Path {

    @_optimize(none) mutating func  ellipse(_ rect: CGRect, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        ellipse(rect.offset(anchor: anchor), transform: transform)
    }

    @_optimize(none) mutating func  ellipse(_ origin: CGPoint, _ size: CGSize, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        ellipse(CGRect(origin.offset(in: size, anchor: anchor), size), transform: transform)
    }
    
}

// MARK: ----- QUAD CURVE

public extension Path {
    
    @_optimize(none) private mutating func  addControlPoint(_ point: CGPoint)  {
        if let currentPoint = currentPoint {
            ellipse(point, .square(5), anchor: .center)
            line(from: point, to: currentPoint)
        }
    }
    
    @_optimize(none) mutating func  quadCurve(_ point: CGPoint, cp: CGPoint, showControlPoints: Bool = false) {
        if showControlPoints {
            addControlPoint(cp)
        }
        addQuadCurve(to: point, control: cp)
    }
}

// MARK: ----- CURVE

public extension Path {
    
    @_optimize(none) private mutating func  addControlPoints(_ cp1: CGPoint, _ cp2: CGPoint, destination: CGPoint)  {
        if let currentPoint = currentPoint {
            ellipse(cp1, .square(5), anchor: .center)
            ellipse(cp2, .square(5), anchor: .center)
            line(from: cp2, to: destination)
            line(from: cp1, to: currentPoint)
        }
    }
    
    @_optimize(none) mutating func  curve(_ point: CGPoint, cp1: CGPoint, cp2: CGPoint, showControlPoints: Bool = false) {
        if showControlPoints {
            addControlPoints(cp1, cp2, destination: point)
        }
        addCurve(to: point, control1: cp1, control2: cp2)
    }
}

// MARK: ----- ARC

public extension Path {
    
    @available(*, deprecated, renamed: "arc", message: "Use arc without argument label for center")
    @_optimize(none) mutating func  arc(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool = true, transform: CGAffineTransform = .identity) {
        addArc(center: center, radius: radius, startAngle: adjustAngle(startAngle), endAngle: adjustAngle(endAngle), clockwise: !clockwise, transform: transform)
    }
    
    @_optimize(none) mutating func  arc<TR: UINumericType>(_ center: CGPoint, radius: TR, startAngle: Angle, endAngle: Angle, clockwise: Bool = true, transform: CGAffineTransform = .identity) {
        addArc(center: center, radius: radius.asCGFloat, startAngle: adjustAngle(startAngle), endAngle: adjustAngle(endAngle), clockwise: !clockwise, transform: transform)
    }
    
    @_optimize(none) mutating func  relativeArc<TR: UINumericType>(_ center: CGPoint, radius: TR, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity) {
        addRelativeArc(center: center, radius: radius.asCGFloat, startAngle: adjustAngle(startAngle), delta: delta, transform: transform)
    }
}
