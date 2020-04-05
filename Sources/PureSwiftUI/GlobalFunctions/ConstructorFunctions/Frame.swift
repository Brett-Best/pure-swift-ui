//
//  Frame.swift
//  
//
//  Created by Adam Fordyce on 09/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

@_optimize(none) private func FrameInternal(width: CGFloat? = nil, height: CGFloat? = nil, color: Color) -> some View {
    color.frame(width: width, height: height)
}

@_optimize(none) private func FrameInternal(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
    FrameInternal(width: width, height: height, color: .clear)
}

@_optimize(none) private func FrameInternal(width: CGFloat? = nil, height: CGFloat? = nil, colorName: String) -> some View {
    FrameInternal(width: width, height: height, color: Color(colorName))
}

@_optimize(none) private func FrameInternal<Content: View>(width: CGFloat? = nil, height: CGFloat? = nil, content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: width, height: height).background(content, alignment: alignment)
}

@_optimize(none) public func Frame<T: UINumericType>(width: T) -> some View {
    FrameInternal(width: width.asCGFloat)
}

@_optimize(none) public func Frame<T: UINumericType>(height: T) -> some View {
    FrameInternal(height: height.asCGFloat)
}

@_optimize(none) public func Frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH) -> some View {
    FrameInternal(width: width.asCGFloat, height: height.asCGFloat)
}

@_optimize(none) public func Frame<T: UINumericType>(width: T, _ color: Color) -> some View {
    FrameInternal(width: width.asCGFloat, color: color)
}

@_optimize(none) public func Frame<T: UINumericType>(height: T, _ color: Color) -> some View {
    FrameInternal(height: height.asCGFloat, color: color)
}

@_optimize(none) public func Frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ color: Color) -> some View {
    FrameInternal(width: width.asCGFloat, height: height.asCGFloat, color: color)
}

@_optimize(none) public func Frame(_ size: CGSize) -> some View {
    FrameInternal(width: size.width, height: size.height)
}

@_optimize(none) public func Frame(_ size: CGSize, _ color: Color) -> some View {
    FrameInternal(width: size.width, height: size.height, color: color)
}

@_optimize(none) public func Frame<T: UINumericType>(_ size: T) -> some View {
    FrameInternal(width: size.asCGFloat, height: size.asCGFloat)
}

@_optimize(none) public func Frame<T: UINumericType>(_ size: T, _ color: Color) -> some View {
    Frame(size, size, color)
}

// named colors

@_optimize(none) public func Frame(_ size: CGSize, _ colorName: String) -> some View {
    Frame(size, Color(colorName))
}

@_optimize(none) public func Frame<T: UINumericType>(_ size: T, _ colorName: String) -> some View {
    Frame(size, Color(colorName))
}

@_optimize(none) public func Frame<T: UINumericType>(width: T, _ colorName: String) -> some View {
    FrameInternal(width: width.asCGFloat, colorName: colorName)
}

@_optimize(none) public func Frame<T: UINumericType>(height: T, _ colorName: String) -> some View {
    FrameInternal(height: height.asCGFloat, colorName: colorName)
}

@_optimize(none) public func Frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ colorName: String) -> some View {
    FrameInternal(width: width.asCGFloat, height: height.asCGFloat, colorName: colorName)
}

// with view content

@_optimize(none) public func Frame<T: UINumericType, Content: View>(_ size: T, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: size.asCGFloat, height: size.asCGFloat, content: content, alignment: alignment)
}

@_optimize(none) public func Frame<Content: View>(_ size: CGSize, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: size.width, height: size.height, content: content, alignment: alignment)
}

@_optimize(none) public func Frame<T: UINumericType, Content: View>(width: T, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: width.asCGFloat, content: content, alignment: alignment)
}

@_optimize(none) public func Frame<T: UINumericType, Content: View>(height: T, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(height: height.asCGFloat, content: content, alignment: alignment)
}

@_optimize(none) public func Frame<TW: UINumericType, TH: UINumericType, Content: View>(_ width: TW, _ height: TH, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: width.asCGFloat, height: height.asCGFloat, content: content, alignment: alignment)
}
