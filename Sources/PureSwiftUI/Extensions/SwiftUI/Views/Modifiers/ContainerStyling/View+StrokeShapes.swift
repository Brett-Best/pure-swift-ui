//
//  View+StrokeShapes.swift
//
//
//  Created by Adam Fordyce on 21/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI


public enum ShapeStrokeType {
    case inner
    case outer
    @available(*, deprecated, renamed: "center")
    case mid
    case center
}

public extension View {
    @_optimize(none) func strokeShape<IS: InsettableShape, SS: ShapeStyle, TLW: UINumericType>(_ shape: IS, content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        RenderIf(strokeType == .inner) {
            self.overlay(shape.strokeBorder(content, lineWidth: lineWidth.asCGFloat))
        }.elseRender {
            RenderIf(strokeType == .outer) {
                self.overlay(shape.inset(by: -lineWidth.asCGFloat).strokeBorder(content, lineWidth: lineWidth.asCGFloat))
            }.elseRender {
                self.overlay(shape.stroke(content, lineWidth: lineWidth.asCGFloat))
            }
        }
        .contentShapeIf(constrainGestures, shape)
    }
    
    @_optimize(none) func strokeShape<IS: InsettableShape, SS: ShapeStyle>(_ shape: IS, content: SS, strokeStyle: StrokeStyle = StrokeStyle(), strokeType: ShapeStrokeType = .inner, constrainGestures: Bool = true) -> some View {
        RenderIf(strokeType == .inner) {
            self.overlay(shape.strokeBorder(content, style: strokeStyle))
        }.elseRender {
            RenderIf(strokeType == .outer) {
                self.overlay(shape.inset(by: -strokeStyle.lineWidth).strokeBorder(content, style: strokeStyle))
            }.elseRender {
                self.overlay(shape.stroke(content, style: strokeStyle))
            }
        }
        .contentShapeIf(constrainGestures, shape)
    }
}

// MARK: - ----- CAPSULE -----

public extension View {

    @_optimize(none) func strokeCapsule<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeCapsule<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeCapsule<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeCapsule(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeCapsule")
    @_optimize(none) func strokeCapsuleWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeCapsule")
    @_optimize(none) func strokeCapsuleWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Capsule(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- CIRCLE -----

public extension View {

    @_optimize(none) func strokeCircle<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeCircle<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeCircle<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeCircle(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeCircle")
    @_optimize(none) func strokeCircleWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeCircle")
    @_optimize(none) func strokeCircleWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Circle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- ELLIPSE -----

public extension View {

    @_optimize(none) func strokeEllipse<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeEllipse<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    
    @_optimize(none) func strokeEllipse<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeEllipse(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeEllipse")
    @_optimize(none) func strokeEllipseWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeEllipse")
    @_optimize(none) func strokeEllipseWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Ellipse(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
    
// MARK: - ----- RECTANGLE -----

public extension View {

    @_optimize(none) func strokeRectangle<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeRectangle<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeRectangle<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeRectangle(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRectangle")
    @_optimize(none) func strokeRectangleWithColor<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRectangle")
    @_optimize(none) func strokeRectangleWithColor(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(Rectangle(), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
    
// MARK: - ----- ROUNDED RECTANGLE -----

public extension View {


    @_optimize(none) func strokeRoundedRectangle<TR: UINumericType, SS: ShapeStyle, TLW: UINumericType>(_ cornerRadius: TR, _ content: SS, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @_optimize(none) func strokeRoundedRectangle<TR: UINumericType, SS: ShapeStyle>(_ cornerRadius: TR, _ content: SS, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Moved cornerRadius and removed argument label for consistency")
    @_optimize(none) func strokeRoundedRectangle<SS: ShapeStyle, TR: UINumericType, TLW: UINumericType>(_ content: SS, cornerRadius: TR, style: RoundedCornerStyle = .circular, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Moved cornerRadius and removed argument label for consistency")
    @_optimize(none) func strokeRoundedRectangle<SS: ShapeStyle, TR: UINumericType>(_ content: SS, cornerRadius: TR, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeRoundedRectangle<TR: UINumericType, TLW: UINumericType>(_ cornerRadius: TR, _ color: Color, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @_optimize(none) func strokeRoundedRectangle<TR: UINumericType>(_ cornerRadius: TR, _ color: Color, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Also moved cornerRadius and removed argument label for consistency")
    @_optimize(none) func strokeRoundedRectangleWithColor<TR: UINumericType, TLW: UINumericType>(_ color: Color, cornerRadius: TR, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Also moved cornerRadius and removed argument label for consistency")
    @_optimize(none) func strokeRoundedRectangleWithColor<TR: UINumericType>(_ color: Color, cornerRadius: TR, style: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerRadius: cornerRadius.asCGFloat, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: - ----- ROUNDED RECTANGLE WITH SIZE -----

public extension View {
    
    @_optimize(none) func strokeRoundedRectangle<SS: ShapeStyle,  TLW: UINumericType>(_ cornerSize: CGSize, _ content: SS, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeRoundedRectangle<SS: ShapeStyle>(_ cornerSize: CGSize, _ content: SS, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

//    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Moved cornerSize and removed argument label for consistency")
//    func strokeRoundedRectangle<SS: ShapeStyle,  TLW: UINumericType>(_ content: SS, cornerSize: CGSize, style: RoundedCornerStyle = .circular, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
//        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
//    }
//
//    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Moved cornerSize and removed argument label for consistency")
//    func strokeRoundedRectangle<SS: ShapeStyle>(_ content: SS, cornerSize: CGSize, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
//        strokeShape(RoundedRectangle(cornerSize, style: style), content: content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
//    }
    
    @_optimize(none) func strokeRoundedRectangle<TLW: UINumericType>(_ cornerSize: CGSize, _ color: Color, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @_optimize(none) func strokeRoundedRectangle(_ cornerSize: CGSize, _ color: Color, strokeStyle: StrokeStyle, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Also moved cornerSize and removed argument label for consistency")
    @_optimize(none) func strokeRoundedRectangleWithColor<TLW: UINumericType>(_ color: Color, cornerSize: CGSize, lineWidth: TLW, style: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @available(*, deprecated, renamed: "strokeRoundedRectangle", message: "Also moved cornerSize and removed argument label for consistency")
    @_optimize(none) func strokebRoundedRectangleWithColor(_ color: Color, cornerSize: CGSize, style: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        strokeShape(RoundedRectangle(cornerSize, style: style), content: color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}
