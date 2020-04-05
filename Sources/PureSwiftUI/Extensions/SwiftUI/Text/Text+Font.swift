//
//  Text+Font.swift
//
//  Created by Adam Fordyce on 13/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- TEXT FONT

public extension Text {
  
    @_optimize(none) private func applyInternalFont(_ theFont: Font, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(theFont)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    // BODY
    
    @_optimize(none) func bodyFont() -> Text {
        bodyFont(nil, nil)
    }
    
    @_optimize(none) func bodyFont(_ weight: Font.Weight? = nil) -> Text {
        bodyFont(nil, weight)
    }

    @_optimize(none) func bodyFont(_ color: Color? = nil) -> Text {
        bodyFont(color, nil)
    }

    @_optimize(none) func bodyFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.body, color, weight)
    }
    
    // CAPTION
    
    @_optimize(none) func captionFont() -> Text {
        captionFont(nil, nil)
    }
    
    @_optimize(none) func captionFont(_ weight: Font.Weight? = nil) -> Text {
        captionFont(nil, weight)
    }

    @_optimize(none) func captionFont(_ color: Color? = nil) -> Text {
        captionFont(color, nil)
    }

    @_optimize(none) func captionFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.caption, color, weight)
    }
    
    // CALLOUT
    
    @_optimize(none) func calloutFont() -> Text {
        calloutFont(nil, nil)
    }
    
    @_optimize(none) func calloutFont(_ weight: Font.Weight? = nil) -> Text {
        calloutFont(nil, weight)
    }

    @_optimize(none) func calloutFont(_ color: Color? = nil) -> Text {
        calloutFont(color, nil)
    }

    @_optimize(none) func calloutFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.callout, color, weight)
    }
    
    // CUSTOM
    
    @_optimize(none) func customFont<T: UINumericType>(_ name: String, _ size: T) -> Text {
        customFont(name, size, nil, nil)
    }
    
    @_optimize(none) func customFont<T: UINumericType>(_ name: String, _ size: T, _ weight: Font.Weight? = nil) -> Text {
        customFont(name, size, nil, weight)
    }

    @_optimize(none) func customFont<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil) -> Text {
        customFont(name, size, color, nil)
    }

    @_optimize(none) func customFont<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.custom(name, size: size.asCGFloat), color, weight)
    }
    
    // CUSTOM WITH JUST SIZE
    
    @_optimize(none) func customFont<T: UINumericType>(_ size: T) -> Text {
        customFont(size, nil, nil)
    }
    
    @_optimize(none) func customFont<T: UINumericType>(_ size: T, _ weight: Font.Weight? = nil) -> Text {
        customFont(size, nil, weight)
    }

    @_optimize(none) func customFont<T: UINumericType>(_ size: T, _ color: Color? = nil) -> Text {
        customFont(size, color, nil)
    }

    @_optimize(none) func customFont<T: UINumericType>(_ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.system(size: size.asCGFloat), color, weight)
    }
    
    // FOOTNOTE
    
    @_optimize(none) func footnoteFont() -> Text {
        footnoteFont(nil, nil)
    }
    
    @_optimize(none) func footnoteFont(_ weight: Font.Weight? = nil) -> Text {
        footnoteFont(nil, weight)
    }

    @_optimize(none) func footnoteFont(_ color: Color? = nil) -> Text {
        footnoteFont(color, nil)
    }

    @_optimize(none) func footnoteFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.footnote, color, weight)
    }
    
    // HEADLINE
    
    @_optimize(none) func headlineFont() -> Text {
        headlineFont(nil, nil)
    }
    
    @_optimize(none) func headlineFont(_ weight: Font.Weight? = nil) -> Text {
        headlineFont(nil, weight)
    }

    @_optimize(none) func headlineFont(_ color: Color? = nil) -> Text {
        headlineFont(color, nil)
    }

    @_optimize(none) func headlineFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.headline, color, weight)
    }
    
    // LARGETITLE
    
    @_optimize(none) func largeTitleFont() -> Text {
        largeTitleFont(nil, nil)
    }
    
    @_optimize(none) func largeTitleFont(_ weight: Font.Weight? = nil) -> Text {
        largeTitleFont(nil, weight)
    }

    @_optimize(none) func largeTitleFont(_ color: Color? = nil) -> Text {
        largeTitleFont(color, nil)
    }

    @_optimize(none) func largeTitleFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.largeTitle, color, weight)
    }
    
    // SUBHEADLINE
    
    @_optimize(none) func subheadlineFont() -> Text {
        subheadlineFont(nil, nil)
    }
    
    @_optimize(none) func subheadlineFont(_ weight: Font.Weight? = nil) -> Text {
        subheadlineFont(nil, weight)
    }

    @_optimize(none) func subheadlineFont(_ color: Color? = nil) -> Text {
        subheadlineFont(color, nil)
    }

    @_optimize(none) func subheadlineFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.subheadline, color, weight)
    }

    // TITLE
    
    @_optimize(none) func titleFont() -> Text {
        titleFont(nil, nil)
    }
    
    @_optimize(none) func titleFont(_ weight: Font.Weight? = nil) -> Text {
        titleFont(nil, weight)
    }

    @_optimize(none) func titleFont(_ color: Color? = nil) -> Text {
        titleFont(color, nil)
    }

    @_optimize(none) func titleFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.title, color, weight)
    }
}

// MARK: ----- TEXT FONT DEPRECATED

public extension Text {
    
    // BODY
    
    @available(*, deprecated, renamed: "bodyFont")
    @_optimize(none) func body() -> Text {
        body(nil, nil)
    }
    
    @available(*, deprecated, renamed: "bodyFont")
    @_optimize(none) func body(_ weight: Font.Weight? = nil) -> Text {
        body(nil, weight)
    }

    @available(*, deprecated, renamed: "bodyFont")
    @_optimize(none) func body(_ color: Color? = nil) -> Text {
        body(color, nil)
    }

    @available(*, deprecated, renamed: "bodyFont")
    @_optimize(none) func body(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.body, color, weight)
    }
    
    // CALLOUT
    
    @available(*, deprecated, renamed: "calloutFont")
    @_optimize(none) func callout() -> Text {
        callout(nil, nil)
    }
    
    @available(*, deprecated, renamed: "calloutFont")
    @_optimize(none) func callout(_ weight: Font.Weight? = nil) -> Text {
        callout(nil, weight)
    }

    @available(*, deprecated, renamed: "calloutFont")
    @_optimize(none) func callout(_ color: Color? = nil) -> Text {
        callout(color, nil)
    }

    @available(*, deprecated, renamed: "calloutFont")
    @_optimize(none) func callout(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.callout, color, weight)
    }
    
    // CAPTION
    
    @available(*, deprecated, renamed: "captionFont")
    @_optimize(none) func caption() -> Text {
        caption(nil, nil)
    }
    
    @available(*, deprecated, renamed: "captionFont")
    @_optimize(none) func caption(_ weight: Font.Weight? = nil) -> Text {
        caption(nil, weight)
    }

    @available(*, deprecated, renamed: "captionFont")
    @_optimize(none) func caption(_ color: Color? = nil) -> Text {
        caption(color, nil)
    }

    @available(*, deprecated, renamed: "captionFont")
    @_optimize(none) func caption(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.caption, color, weight)
    }
    
    // FOOTNOTE
    
    @available(*, deprecated, renamed: "footnoteFont")
    @_optimize(none) func footnote() -> Text {
        footnote(nil, nil)
    }
    
    @available(*, deprecated, renamed: "footnoteFont")
    @_optimize(none) func footnote(_ weight: Font.Weight? = nil) -> Text {
        footnote(nil, weight)
    }

    @available(*, deprecated, renamed: "footnoteFont")
    @_optimize(none) func footnote(_ color: Color? = nil) -> Text {
        footnote(color, nil)
    }

    @available(*, deprecated, renamed: "footnoteFont")
    @_optimize(none) func footnote(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.footnote, color, weight)
    }
    
    // HEADLINE
    
    @available(*, deprecated, renamed: "headlineFont")
    @_optimize(none) func headline() -> Text {
        headline(nil, nil)
    }
    
    @available(*, deprecated, renamed: "headlineFont")
    @_optimize(none) func headline(_ weight: Font.Weight? = nil) -> Text {
        headline(nil, weight)
    }

    @available(*, deprecated, renamed: "headlineFont")
    @_optimize(none) func headline(_ color: Color? = nil) -> Text {
        headline(color, nil)
    }

    @available(*, deprecated, renamed: "headlineFont")
    @_optimize(none) func headline(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.headline, color, weight)
    }
    
    // LARGETITLE
    
    @available(*, deprecated, renamed: "largeTitleFont")
    @_optimize(none) func largeTitle() -> Text {
        largeTitle(nil, nil)
    }
    
    @available(*, deprecated, renamed: "largeTitleFont")
    @_optimize(none) func largeTitle(_ weight: Font.Weight? = nil) -> Text {
        largeTitle(nil, weight)
    }

    @available(*, deprecated, renamed: "largeTitleFont")
    @_optimize(none) func largeTitle(_ color: Color? = nil) -> Text {
        largeTitle(color, nil)
    }

    @available(*, deprecated, renamed: "largeTitleFont")
    @_optimize(none) func largeTitle(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.largeTitle, color, weight)
    }
    
    // SUBHEADLINE
    
    @available(*, deprecated, renamed: "subheadlineFont")
    @_optimize(none) func subheadline() -> Text {
        subheadline(nil, nil)
    }
    
    @available(*, deprecated, renamed: "subheadlineFont")
    @_optimize(none) func subheadline(_ weight: Font.Weight? = nil) -> Text {
        subheadline(nil, weight)
    }

    @available(*, deprecated, renamed: "subheadlineFont")
    @_optimize(none) func subheadline(_ color: Color? = nil) -> Text {
        subheadline(color, nil)
    }

    @available(*, deprecated, renamed: "subheadlineFont")
    @_optimize(none) func subheadline(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {        applyInternalFont(.subheadline, color, weight)
    }

    // TITLE
    
    @available(*, deprecated, renamed: "titleFont")
    @_optimize(none) func title() -> Text {
        title(nil, nil)
    }
    
    @available(*, deprecated, renamed: "titleFont")
    @_optimize(none) func title(_ weight: Font.Weight? = nil) -> Text {
        title(nil, weight)
    }

    @available(*, deprecated, renamed: "titleFont")
    @_optimize(none) func title(_ color: Color? = nil) -> Text {
        title(color, nil)
    }

    @available(*, deprecated, renamed: "titleFont")
    @_optimize(none) func title(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.title, color, weight)
    }
}
