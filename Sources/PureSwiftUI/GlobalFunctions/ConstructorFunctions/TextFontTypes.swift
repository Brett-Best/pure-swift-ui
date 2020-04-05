//
//  TextFontTypes.swift
//  
//
//  Created by Adam Fordyce on 27/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- BODY

@_optimize(none) public func BodyText<S: StringProtocol>(_ content: S) -> Text {
    BodyText(content, nil, nil)
}

@_optimize(none) public func BodyText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    BodyText(content, color, nil)
}

@_optimize(none) public func BodyText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    BodyText(content, nil, weight)
}

@_optimize(none) public func BodyText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .bodyFont(color, weight)
}

// MARK: ----- CALLOUT

@_optimize(none) public func CalloutText<S: StringProtocol>(_ content: S) -> Text {
    CalloutText(content, nil, nil)
}

@_optimize(none) public func CalloutText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    CalloutText(content, color, nil)
}

@_optimize(none) public func CalloutText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    CalloutText(content, nil, weight)
}

@_optimize(none) public func CalloutText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .calloutFont(color, weight)
}

// MARK: ----- CAPTION

@_optimize(none) public func CaptionText<S: StringProtocol>(_ content: S) -> Text {
    CaptionText(content, nil, nil)
}

@_optimize(none) public func CaptionText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    CaptionText(content, color, nil)
}

@_optimize(none) public func CaptionText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    CaptionText(content, nil, weight)
}

@_optimize(none) public func CaptionText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .captionFont(color, weight)
}

// MARK: ----- CUSTOM

@_optimize(none) public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T) -> Text {
    CustomText(content, name, size, nil, nil)
}

@_optimize(none) public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ weight: Font.Weight? = nil) -> Text {
    CustomText(content, name, size, nil, weight)
}

@_optimize(none) public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ color: Color? = nil) -> Text {
    CustomText(content, name, size, color, nil)
}

@_optimize(none) public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .customFont(name, size, color, weight)
}

// CUSTOM FONT THAT SCALES

@_optimize(none) public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T) -> some View {
    CustomTextThatScales(content, name, size, nil, nil)
}

@_optimize(none) public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ weight: Font.Weight? = nil) -> some View {
    CustomTextThatScales(content, name, size, nil, weight)
}

@_optimize(none) public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ color: Color? = nil) -> some View {
    CustomTextThatScales(content, name, size, color, nil)
}

@_optimize(none) public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
    Text(content)
        .customFontThatScales(name, size, color, weight)
}

// MARK: ----- CUSTOM WITH SIZE

@_optimize(none) public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T) -> Text {
    CustomText(content, size, nil, nil)
}

@_optimize(none) public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ weight: Font.Weight? = nil) -> Text {
    CustomText(content, size, nil, weight)
}

@_optimize(none) public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ color: Color? = nil) -> Text {
    CustomText(content, size, color, nil)
}

@_optimize(none) public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        Text(content)
            .customFont(size, color, weight)
}

// CUSTOM FONT SIZE THAT SCALES

@_optimize(none) public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T) -> some View {
    CustomTextThatScales(content, size, nil, nil)
}

@_optimize(none) public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ weight: Font.Weight? = nil) -> some View {
    CustomTextThatScales(content, size, nil, weight)
}

@_optimize(none) public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ color: Color? = nil) -> some View {
    CustomTextThatScales(content, size, color, nil)
}

@_optimize(none) public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        Text(content)
            .customFontThatScales(size, color, weight)
}

// MARK: ----- FOOTNOTE

@_optimize(none) public func FootnoteText<S: StringProtocol>(_ content: S) -> Text {
    FootnoteText(content, nil, nil)
}

@_optimize(none) public func FootnoteText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    FootnoteText(content, color, nil)
}

@_optimize(none) public func FootnoteText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    FootnoteText(content, nil, weight)
}

@_optimize(none) public func FootnoteText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .footnoteFont(color, weight)
}

// MARK: ----- HEADLINE

@_optimize(none) public func HeadlineText<S: StringProtocol>(_ content: S) -> Text {
    HeadlineText(content, nil, nil)
}

@_optimize(none) public func HeadlineText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    HeadlineText(content, color, nil)
}

@_optimize(none) public func HeadlineText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    HeadlineText(content, nil, weight)
}

@_optimize(none) public func HeadlineText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .headlineFont(color, weight)
}

// MARK: ----- LARGETITLE

@_optimize(none) public func LargeTitleText<S: StringProtocol>(_ content: S) -> Text {
    LargeTitleText(content, nil, nil)
}

@_optimize(none) public func LargeTitleText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    LargeTitleText(content, color, nil)
}

@_optimize(none) public func LargeTitleText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    LargeTitleText(content, nil, weight)
}

@_optimize(none) public func LargeTitleText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .largeTitleFont(color, weight)
}

// MARK: ----- SUBHEADLINE

@_optimize(none) public func SubheadlineText<S: StringProtocol>(_ content: S) -> Text {
    SubheadlineText(content, nil, nil)
}

@_optimize(none) public func SubheadlineText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    SubheadlineText(content, color, nil)
}

@_optimize(none) public func SubheadlineText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    SubheadlineText(content, nil, weight)
}

@_optimize(none) public func SubheadlineText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .subheadlineFont(color, weight)
}

// MARK: ----- TITLE

@_optimize(none) public func TitleText<S: StringProtocol>(_ content: S) -> Text {
    TitleText(content, nil, nil)
}

@_optimize(none) public func TitleText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    TitleText(content, color, nil)
}

@_optimize(none) public func TitleText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    TitleText(content, nil, weight)
}

@_optimize(none) public func TitleText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .titleFont(color, weight)
}

