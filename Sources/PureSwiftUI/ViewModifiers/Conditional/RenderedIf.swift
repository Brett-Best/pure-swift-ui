//
//  RenderedIf.swift
//  
//
//  Created by Adam Fordyce on 15/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public struct RenderedIf: ViewModifier {
    let condition: Bool
    
    @_optimize(none) public init(_ condition: Bool) {
        self.condition = condition
    }
    
    @_optimize(none) public func body(content: Content) -> some View {
        RenderIf(condition) {
            content
        }
    }
}

public extension View {
    
    @_optimize(none) func renderedIf(_ condition: Bool) -> some View {
        modifier(RenderedIf(condition))
    }
}
