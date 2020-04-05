//
//  View+.swift
//
//
//  Created by Adam Fordyce on 19/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: - ----- TYPE ERASURE

public extension View {

    var asAnyView: AnyView {
        AnyView(self)
    }
}

// MARK: ----- FOREGROUND

public extension View {
    
    @_optimize(none) func foregroundColor(_ colorName: String) -> some View {
        foregroundColor(Color(colorName))
    }
}

// MARK: - ----- BACKGROUND

public extension View {
    
    @_optimize(none) func backgroundColor(_ color: Color,  alignment: Alignment = .center) -> some View {
        background(color, alignment: alignment)
    }
    
    @_optimize(none) func backgroundColor(_ colorName: String,  alignment: Alignment = .center) -> some View {
        background(Color(colorName), alignment: alignment)
    }
}

// MARK: ----- OVERLAY

public extension View {
    
    @_optimize(none) func overlayColor(_ colorName: String, alignment: Alignment = .center) -> some View {
        overlay(Color(colorName), alignment: alignment)
    }
    
    @_optimize(none) func overlayColor(_ color: Color, alignment: Alignment = .center) -> some View {
        overlay(color, alignment: alignment)
    }
}

// MARK: - ----- BORDER

public extension View {
    
    @_optimize(none) func borderColor(_ color: Color) -> some View {
        border(color)
    }
    
    @_optimize(none) func borderColor(_ colorName: String) -> some View {
        borderColor(Color(colorName))
    }
    
    @_optimize(none) func borderColor<T: UINumericType>(_ color: Color, width: T) -> some View {
        border(color, width: width.asCGFloat)
    }
    
    @_optimize(none) func borderColor<T: UINumericType>(_ colorName: String, width: T) -> some View {
        borderColor(Color(colorName), width: width)
    }
}

// MARK: - ----- FONT

public extension View {
    
    @_optimize(none) func fontSize<T: UINumericType>(_ size: T, weight: Font.Weight? = nil, withScaling: Bool = true) -> some View {
        fontSize(size, name: nil, weight: weight, withScaling: withScaling)
    }
    
    @_optimize(none) func fontSize<T: UINumericType>(_ size: T, name: String? = nil, weight: Font.Weight? = nil, withScaling: Bool = true) -> some View {
        RenderIf(withScaling) {
            self.scalingFont(size: size, name: name, weight: weight)
        }.elseRender {
            self.font(self.createFont(name: name, size: size.asCGFloat, weight: weight))
        }
    }
    
    @_optimize(none) private func createFont(name: String?, size: CGFloat, weight: Font.Weight?) -> Font {
        if let name = name {
            if let weight = weight {
                return Font.custom(name, size: size).weight(weight)
            } else {
                return Font.custom(name, size: size)
            }
        } else {
            if let weight = weight {
                return Font.system(size: size).weight(weight)
            } else {
                return Font.system(size: size)
            }
        }
    }
  
    @_optimize(none) private func applyInternalFont(_ theFont: Font, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        RenderIf(weight != nil) {
            self.font(theFont.weight(weight!))
        }.elseRender {
            self.font(theFont)
        }
        .foregroundColor(color)
    }
    
    // BODY
    
    @_optimize(none) func bodyFont() -> some View {
        bodyFont(nil, nil)
    }
    
    @_optimize(none) func bodyFont(_ weight: Font.Weight? = nil) -> some View {
        bodyFont(nil, weight)
    }

    @_optimize(none) func bodyFont(_ color: Color? = nil) -> some View {
        bodyFont(color, nil)
    }

    @_optimize(none) func bodyFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.body, color, weight)
    }
    
    // CAPTION
    
    @_optimize(none) func captionFont() -> some View {
        captionFont(nil, nil)
    }
    
    @_optimize(none) func captionFont(_ weight: Font.Weight? = nil) -> some View {
        captionFont(nil, weight)
    }

    @_optimize(none) func captionFont(_ color: Color? = nil) -> some View {
        captionFont(color, nil)
    }

    @_optimize(none) func captionFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.caption, color, weight)
    }
    
    // CALLOUT
    
    @_optimize(none) func calloutFont() -> some View {
        calloutFont(nil, nil)
    }
    
    @_optimize(none) func calloutFont(_ weight: Font.Weight? = nil) -> some View {
        calloutFont(nil, weight)
    }

    @_optimize(none) func calloutFont(_ color: Color? = nil) -> some View {
        calloutFont(color, nil)
    }

    @_optimize(none) func calloutFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.callout, color, weight)
    }
    
    // CUSTOM
    
    @_optimize(none) func customFont<T: UINumericType>(_ name: String, _ size: T) -> some View {
        customFont(name, size, nil, nil)
    }
    
    @_optimize(none) func customFont<T: UINumericType>(_ name: String, _ size: T, _ weight: Font.Weight? = nil) -> some View {
        customFont(name, size, nil, weight)
    }

    @_optimize(none) func customFont<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil) -> some View {
        customFont(name, size, color, nil)
    }

    @_optimize(none) func customFont<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.custom(name, size: size.asCGFloat), color, weight)
    }
    
    // CUSTOM WITH JUST SIZE
    
    @_optimize(none) func customFont<T: UINumericType>(_ size: T) -> some View {
        customFont(size, nil, nil)
    }
    
    @_optimize(none) func customFont<T: UINumericType>(_ size: T, _ weight: Font.Weight? = nil) -> some View {
        customFont(size, nil, weight)
    }

    @_optimize(none) func customFont<T: UINumericType>(_ size: T, _ color: Color? = nil) -> some View {
        customFont(size, color, nil)
    }

    @_optimize(none) func customFont<T: UINumericType>(_ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.system(size: size.asCGFloat), color, weight)
    }
    
    // CUSTOM FONT THAT SCALES
    
    @_optimize(none) func customFontThatScales<T: UINumericType>(_ name: String, _ size: T) -> some View {
        customFontThatScales(name, size, nil, nil)
    }
    
    @_optimize(none) func customFontThatScales<T: UINumericType>(_ name: String, _ size: T, _ weight: Font.Weight? = nil) -> some View {
        customFontThatScales(name, size, nil, weight)
    }

    @_optimize(none) func customFontThatScales<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil) -> some View {
        customFontThatScales(name, size, color, nil)
    }

    @_optimize(none) func customFontThatScales<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        fontSize(size, name: name, weight: weight)
            .foregroundColor(color)
    }
    
    // CUSTOM WITH JUST SIZE
    
    @_optimize(none) func customFontThatScales<T: UINumericType>(_ size: T) -> some View {
        customFontThatScales(size, nil, nil)
    }
    
    @_optimize(none) func customFontThatScales<T: UINumericType>(_ size: T, _ weight: Font.Weight? = nil) -> some View {
        customFontThatScales(size, nil, weight)
    }

    @_optimize(none) func customFontThatScales<T: UINumericType>(_ size: T, _ color: Color? = nil) -> some View {
        customFontThatScales(size, color, nil)
    }

    @_optimize(none) func customFontThatScales<T: UINumericType>(_ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        fontSize(size, weight: weight)
            .foregroundColor(color)
    }
    
    // FOOTNOTE
    
    @_optimize(none) func footnoteFont() -> some View {
        footnoteFont(nil, nil)
    }
    
    @_optimize(none) func footnoteFont(_ weight: Font.Weight? = nil) -> some View {
        footnoteFont(nil, weight)
    }

    @_optimize(none) func footnoteFont(_ color: Color? = nil) -> some View {
        footnoteFont(color, nil)
    }

    @_optimize(none) func footnoteFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.footnote, color, weight)
    }
    
    // HEADLINE
    
    @_optimize(none) func headlineFont() -> some View {
        headlineFont(nil, nil)
    }
    
    @_optimize(none) func headlineFont(_ weight: Font.Weight? = nil) -> some View {
        headlineFont(nil, weight)
    }

    @_optimize(none) func headlineFont(_ color: Color? = nil) -> some View {
        headlineFont(color, nil)
    }

    @_optimize(none) func headlineFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.headline, color, weight)
    }
    
    // LARGETITLE
    
    @_optimize(none) func largeTitleFont() -> some View {
        largeTitleFont(nil, nil)
    }
    
    @_optimize(none) func largeTitleFont(_ weight: Font.Weight? = nil) -> some View {
        largeTitleFont(nil, weight)
    }

    @_optimize(none) func largeTitleFont(_ color: Color? = nil) -> some View {
        largeTitleFont(color, nil)
    }

    @_optimize(none) func largeTitleFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.largeTitle, color, weight)
    }
    
    // SUBHEADLINE
    
    @_optimize(none) func subheadlineFont() -> some View {
        subheadlineFont(nil, nil)
    }
    
    @_optimize(none) func subheadlineFont(_ weight: Font.Weight? = nil) -> some View {
        subheadlineFont(nil, weight)
    }

    @_optimize(none) func subheadlineFont(_ color: Color? = nil) -> some View {
        subheadlineFont(color, nil)
    }

    @_optimize(none) func subheadlineFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.subheadline, color, weight)
    }

    // TITLE
    
    @_optimize(none) func titleFont() -> some View {
        titleFont(nil, nil)
    }
    
    @_optimize(none) func titleFont(_ weight: Font.Weight? = nil) -> some View {
        titleFont(nil, weight)
    }

    @_optimize(none) func titleFont(_ color: Color? = nil) -> some View {
        titleFont(color, nil)
    }

    @_optimize(none) func titleFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        applyInternalFont(.title, color, weight)
    }
}

// MARK: - ----- FRAME

public extension View {

    @_optimize(none) func width<T: UINumericType>(_ width: T, _ alignment: Alignment = .center) -> some View {
        frame(width: width.asCGFloat, alignment: alignment)
    }
  
    @_optimize(none) func height<T: UINumericType>(_ height: T, _ alignment: Alignment = .center) -> some View {
        frame(height: height.asCGFloat, alignment: alignment)
    }
    
    @_optimize(none) func frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ alignment: Alignment = .center) -> some View {
        frame(width: width.asCGFloat, height: height.asCGFloat, alignment: alignment)
    }
    
    @_optimize(none) func frame<T: UINumericType>(_ size: T, _ alignment: Alignment = .center) -> some View {
        frame(width: size.asCGFloat, height: size.asCGFloat, alignment: alignment)
    }
    
    // native type
    @_optimize(none) func frame(_ size: CGSize, _ alignment: Alignment = .center) -> some View {
        frame(width: size.width, height: size.height, alignment: alignment)
    }
    
    @_optimize(none) func width(_ width: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(width: width, alignment: alignment)
    }

    @_optimize(none) func height(_ height: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(height: height, alignment: alignment)
    }

    @_optimize(none) func frame(_ width: CGFloat, _ height: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(width: width, height: height, alignment: alignment)
    }

    @_optimize(none) func frame(_ size: CGFloat, _ alignment: Alignment = .center) -> some View {
      frame(width: size, height: size, alignment: alignment)
    }
    
    //other
    @_optimize(none) func greedyWidth(_ alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @_optimize(none) func greedyHeight(_ alignment: Alignment = .center) -> some View {
        frame(maxHeight: .infinity, alignment: alignment)
    }
    
    @_optimize(none) func greedyFrame(_ alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
}

// MARK: - ----- OFFSET

public extension View {
    
    @_optimize(none) func offset<T_LHS: UINumericType, T_RHS: UINumericType>(_ x: T_LHS, _ y: T_RHS) -> some View {
        offset(x: x.asCGFloat, y: y.asCGFloat)
    }
    
    @_optimize(none) func xOffset<T: UINumericType>(_ x: T) -> some View {
        offset(x: x.asCGFloat)
    }

    @_optimize(none) func yOffset<T: UINumericType>(_ y: T) -> some View {
        offset(y: y.asCGFloat)
    }
    
    //native
    @_optimize(none) func offset(_ x: CGFloat, _ y: CGFloat) -> some View {
        offset(x: x, y: y)
    }

    @_optimize(none) func xOffset(_ x: CGFloat) -> some View {
        offset(x: x)
    }

    @_optimize(none) func yOffset(_ y: CGFloat) -> some View {
        offset(y: y)
    }
    
    @_optimize(none) func offset(_ point: CGPoint) -> some View {
        offset(x: point.x, y: point.y)
    }
}

// MARK: ----- POSITION

public extension View {
    
    @_optimize(none) func position<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> some View {
        position(x: x.asCGFloat, y: y.asCGFloat)
    }
    
    @available(*, deprecated, renamed: "position", message: "Can't set x or y positions individually since the underlying implementation defaults to 0 for the other dimension")
    @_optimize(none) func xPosition<T: UINumericType>(_ x: T) -> some View {
        position(x: x.asCGFloat)
    }
    
    @available(*, deprecated, renamed: "position", message: "Can't set x or y positions individually since the underlying implementation defaults to 0 for the other dimension")
    @_optimize(none) func yPosition<T: UINumericType>(_ y: T) -> some View {
        position(y: y.asCGFloat)
    }
}

// MARK: - ----- OPACITY

public extension View {

    @_optimize(none) func opacity<T: UINumericType>(_ theOpacity: T) -> some View {
        opacity(theOpacity.asDouble)
    }
}

// MARK: ----- BLUR

public extension View {

    @_optimize(none) func blur<T: UINumericType>(_ radius: T, opaque: Bool = false) -> some View {
        blur(radius: radius.asCGFloat, opaque: opaque)
    }
}

// MARK: ----- IMAGE PROCESSING

public extension View {
 
    @_optimize(none) func saturation<T: UINumericType>(_ amount: T) -> some View {
        saturation(amount.asDouble)
    }
    
    @_optimize(none) func brightness<T: UINumericType>(_ amount: T) -> some View {
        brightness(amount.asDouble)
    }
    
    @_optimize(none) func contrast<T: UINumericType>(_ amount: T) -> some View {
        contrast(amount.asDouble)
    }
    
    @_optimize(none) func grayscale<T: UINumericType>(_ amount: T) -> some View {
        grayscale(amount.asDouble)
    }
}

// MARK: ----- SHADOW

public extension View {
    
    @_optimize(none) func shadow<T: UINumericType, TX: UINumericType, TY: UINumericType>(_ radius: T, x: TX, y: TY) -> some View {
        shadow(radius: radius.asCGFloat, x: x.asCGFloat, y: y.asCGFloat)
    }
    
    @_optimize(none) func shadow<T: UINumericType>(_ radius: T) -> some View {
        shadow(radius, x: 0, y: 0)
    }
    
    @_optimize(none) func shadow<T: UINumericType, TX: UINumericType>(_ radius: T, x: TX) -> some View {
        shadow(radius, x: x, y: 0)
    }
    
    @_optimize(none) func shadow<T: UINumericType, TY: UINumericType>(_ radius: T, y: TY) -> some View {
        shadow(radius, x: 0, y: y)
    }
    
    @_optimize(none) func shadow<T: UINumericType>(_ radius: T, offset: CGPoint) -> some View {
        shadow(radius, x: offset.x, y: offset.y)
    }
    
    @_optimize(none) func shadow<TR: UINumericType, TO: UINumericType>(_ radius: TR, offset: TO, angle: Angle) -> some View {
        shadow(radius, offset: .point(offset, angle))
    }

    @available(*, deprecated, renamed: "shadowColor")
    @_optimize(none) func shadow<T: UINumericType, TX: UINumericType, TY: UINumericType>(_ color: Color, _ radius: T, x: TX, y: TY) -> some View {
        shadow(color: color, radius: radius.asCGFloat, x: x.asCGFloat, y: y.asCGFloat)
    }
    
    @available(*, deprecated, renamed: "shadowColor")
    @_optimize(none) func shadow<T: UINumericType>(_ color: Color, _ radius: T) -> some View {
        shadow(color, radius, x: 0, y: 0)
    }
    
    @available(*, deprecated, renamed: "shadowColor")
    @_optimize(none) func shadow<T: UINumericType, TX: UINumericType>(_ color: Color, _ radius: T, x: TX) -> some View {
        shadow(color, radius, x: x, y: 0)
    }
    
    @available(*, deprecated, renamed: "shadowColor")
    @_optimize(none) func shadow<T: UINumericType, TY: UINumericType>(_ color: Color, _ radius: T, y: TY) -> some View {
        shadow(color, radius, x: 0, y: y)
    }
    
    @_optimize(none) func shadowColor<T: UINumericType, TX: UINumericType, TY: UINumericType>(_ color: Color, _ radius: T, x: TX, y: TY) -> some View {
        shadow(color: color, radius: radius.asCGFloat, x: x.asCGFloat, y: y.asCGFloat)
    }
    
    @_optimize(none) func shadowColor<T: UINumericType>(_ color: Color, _ radius: T) -> some View {
        shadowColor(color, radius, x: 0, y: 0)
    }
    
    @_optimize(none) func shadowColor<T: UINumericType, TX: UINumericType>(_ color: Color, _ radius: T, x: TX) -> some View {
        shadowColor(color, radius, x: x, y: 0)
    }
    
    @_optimize(none) func shadowColor<T: UINumericType, TY: UINumericType>(_ color: Color, _ radius: T, y: TY) -> some View {
        shadowColor(color, radius, x: 0, y: y)
    }
    
    @_optimize(none) func shadowColor<T: UINumericType, TX: UINumericType, TY: UINumericType>(_ colorName: String, _ radius: T, x: TX, y: TY) -> some View {
        shadowColor(Color(colorName), radius, x: x, y: y)
    }
    
    @_optimize(none) func shadowColor<T: UINumericType>(_ colorName: String, _ radius: T) -> some View {
        shadowColor(colorName, radius, x: 0, y: 0)
    }
    
    @_optimize(none) func shadowColor<T: UINumericType, TX: UINumericType>(_ colorName: String, _ radius: T, x: TX) -> some View {
        shadowColor(colorName, radius, x: x, y: 0)
    }
    
    @_optimize(none) func shadowColor<T: UINumericType, TY: UINumericType>(_ colorName: String, _ radius: T, y: TY) -> some View {
        shadowColor(colorName, radius, x: 0, y: y)
    }
    
    @_optimize(none) func shadowColor<T: UINumericType>(_ colorName: String, _ radius: T, offset: CGPoint) -> some View {
        shadowColor(colorName, radius, x: offset.x, y: offset.y)
    }
    
    @_optimize(none) func shadowColor<TR: UINumericType, TO: UINumericType>(_ colorName: String, _ radius: TR, offset: TO, angle: Angle) -> some View {
        shadowColor(colorName, radius, offset: .point(offset, angle))
    }
}

// MARK: ------ PADDING

public extension View {

    @_optimize(none) func hPadding() -> some View {
        padding(.horizontal)
    }

    @_optimize(none) func vPadding() -> some View {
        padding(.vertical)
    }

    @_optimize(none) func hPadding<T: UINumericType>(_ horizontalPadding: T) -> some View {
        padding(.horizontal, horizontalPadding.asCGFloat)
    }
    
    @_optimize(none) func vPadding<T: UINumericType>(_ verticalPadding: T) -> some View {
        padding(.vertical, verticalPadding.asCGFloat)
    }
    
    //native
    @_optimize(none) func hPadding(_ horizontalPadding: CGFloat) -> some View {
        padding(.horizontal, horizontalPadding)
    }
    
    @_optimize(none) func vPadding(_ verticalPadding: CGFloat) -> some View {
        padding(.vertical, verticalPadding)
    }
}

// MARK: - ----- ROTATION

public extension View {

    @_optimize(none) func rotate(_ angle: Angle, anchor: UnitPoint = .center) -> some View {
        rotationEffect(angle, anchor: anchor)
    }
    
    @_optimize(none) func rotate3D(_ angle: Angle, _ axis: (x: CGFloat, y: CGFloat, z: CGFloat), anchor: UnitPoint = .center, anchorZ: CGFloat = 0, perspective: CGFloat = 1) -> some View {
        rotation3DEffect(angle, axis: axis, anchor: anchor, anchorZ: anchorZ, perspective: perspective)
    }
}

// MARK: - ----- SCALE

public extension View {

    @_optimize(none) func scale<T: UINumericType>(_ scaleFactor: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(scaleFactor.asCGFloat, anchor: anchor)
    }
    
    @_optimize(none) func scale<TX: UINumericType, TY: UINumericType>(_ scaleX: TX, _ scaleY: TY, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX.asCGFloat, y: scaleY.asCGFloat, anchor: anchor)
    }
    
    @_optimize(none) func xScale<T: UINumericType>(_ scaleX: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX.asCGFloat, y: 1, anchor: anchor)
    }
    
    @_optimize(none) func yScale<T: UINumericType>(_ scaleY: T, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: 1, y: scaleY.asCGFloat, anchor: anchor)
    }
    
    //native
    @_optimize(none) func scale(_ scaleFactor: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(scaleFactor, anchor: anchor)
    }
    
    @_optimize(none) func scale(_ scaleSize: CGSize, anchor: UnitPoint = .center) -> some View {
        scaleEffect(scaleSize, anchor: anchor)
    }
    
    @_optimize(none) func scale(_ scaleX: CGFloat, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX, y: scaleY, anchor: anchor)
    }
    
    @_optimize(none) func xScale(_ scaleX: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: scaleX, y: 1, anchor: anchor)
    }
    
    @_optimize(none) func yScale(_ scaleY: CGFloat, anchor: UnitPoint = .center) -> some View {
        scaleEffect(x: 1, y: scaleY, anchor: anchor)
    }
}

// MARK: ----- Z-INDEX

private struct EnvironmentColorSchemeViewModifier: ViewModifier {
    
    let colorScheme: ColorScheme
    
    @_optimize(none) init(_ colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
    }

    @_optimize(none) func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, colorScheme)
    }
}

public extension View {
    
    @_optimize(none) func envDarkMode() -> some View {
        modifier(EnvironmentColorSchemeViewModifier(.dark))
    }

    @_optimize(none) func envLightMode() -> some View {
        modifier(EnvironmentColorSchemeViewModifier(.light))
    }
    
    @_optimize(none) func envColorScheme(_ scheme: ColorScheme) -> some View {
        modifier(EnvironmentColorSchemeViewModifier(scheme))
    }
}

// MARK: ----- GEOMETRY READER

public extension View {
    
    @_optimize(none) func geometryReader(_ geoCallback: @escaping (GeometryProxy) -> ()) -> some View {
        geometryReader(id: 1, geoCallback)
    }
    
    @_optimize(none) func geometryReader<T: Hashable>(id: T, _ geoCallback: @escaping (GeometryProxy) -> ()) -> some View {
        overlay(GeometryReader { (geo: GeometryProxy) in
            Color.clear.onAppear {
                geoCallback(geo)
            }
            .id(id)
        })
    }
}

// MARK: ----- RELATIVE OFFSET

public extension View {
    
    @_optimize(none) func relativeXOffset<T: UINumericType>(_ xOffset: T) -> some View {
        relativeXOffsetIf(true, xOffset)
    }
    
    @_optimize(none) func relativeYOffset<T: UINumericType>(_ yOffset: T) -> some View {
        relativeYOffsetIf(true, yOffset)
    }
    
    @_optimize(none) func relativeOffset<TX: UINumericType, TY: UINumericType>(_ xOffset: TX, _ yOffset: TY) -> some View {
        relativeOffsetIf(true, xOffset, yOffset)
    }
}

// MARK: ----- OFFSET TO POSITION

public extension View {

    /**
    Offsets the view to an absolute position within the specified coordinate space.
     - Parameters:
       - xPosition: required xPosition within coordinate space
       - yPosition: required yPosition within coordinate space
       - coordinateSpace: Coordinate space in which to perform the offset
       - anchor: where to anchor the view being offset
     - Warning:
     If you need to specify a named CoordinateSpace, use the method that takes
     coordinateSpaceName as a String parameter rather than passing .named(...). There is a runtime
     issue if you try to use .named(coordinateSpace) at the call-site.
    */
    @_optimize(none) func offsetToPosition<TX: UINumericType, TY: UINumericType>(_ xPosition: TX, _ yPosition: TY, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(true, xPosition, yPosition, in: coordinateSpace,
        anchor: anchor)
    }
    
    @_optimize(none) func offsetToPosition<TX: UINumericType, TY: UINumericType, TC: Hashable>(_ xPosition: TX, _ yPosition: TY, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        offsetToPosition(xPosition, yPosition, in: .named(coordinateSpaceName), anchor: anchor)
    }

    @_optimize(none) func offsetToPosition(_ position: CGPoint, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        offsetToPositionIf(true, position, in: coordinateSpace,
        anchor: anchor)
    }
    
    @_optimize(none) func offsetToPosition<TC: Hashable>(_ position: CGPoint, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        offsetToPosition(position, in: .named(coordinateSpaceName), anchor: anchor)
    }
    
    @_optimize(none) func xOffsetToXPosition<T: UINumericType>(_ xPosition: T, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        xOffsetToXPositionIf(true, xPosition, in: coordinateSpace, anchor: anchor)
    }

    @_optimize(none) func xOffsetToXPosition<T: UINumericType, TC: Hashable>(_ xPosition: T, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
         xOffsetToXPosition(xPosition, in: .named(coordinateSpaceName), anchor: anchor)
    }
    
    @_optimize(none) func yOffsetToYPosition<T: UINumericType>(_ yPosition: T, in coordinateSpace: CoordinateSpace = .global, anchor: UnitPoint = .center) -> some View {
        yOffsetToYPositionIf(true, yPosition, in: coordinateSpace,
        anchor: anchor)
    }
    
    @_optimize(none) func yOffsetToYPosition<T: UINumericType, TC: Hashable>(_ yPosition: T, in coordinateSpaceName: TC, anchor: UnitPoint = .center) -> some View {
        yOffsetToYPosition(yPosition, in: .named(coordinateSpaceName), anchor: anchor)
    }
}

// MARK: ----- OFFSET WITH ANGLE

public extension View {
    
    @_optimize(none) func offsetFromAngle(baseRotation: Angle, offsetAngle: Angle, forRadius radius: Double) -> some View {
        offset(x: calcXOffset(radius: radius, angle: baseRotation + offsetAngle), y: -calcYOffset(radius: radius, angle: baseRotation + offsetAngle))
    }
    
    @_optimize(none) func offset<T: UINumericType>(radius: T, angle: Angle) -> some View {
        offset(calcOffset(radius: radius, angle: angle))
    }
}
