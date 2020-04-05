//
//  Edge+Convenience.swift
//  
//
//  Created by Adam Fordyce on 02/02/2020.
//

import SwiftUI

// MARK: ----- INSETS

public extension Edge.Set {

    @_optimize(none) func inset(_ edgeSet: Edge.Set, _ size: CGFloat) -> CGFloat {
        self.contains(edgeSet) ? size : 0
    }
    
    @_optimize(none) func inset<T: UINumericType>(_ edgeSet: Edge.Set, _ size: T) -> CGFloat {
        inset(edgeSet, size.asCGFloat)
    }

    @_optimize(none) func hInset(_ size: CGFloat) -> CGFloat {
        inset(.horizontal, size)
    }
    
    @_optimize(none) func hInset<T: UINumericType>(_ size: T) -> CGFloat {
        inset(.horizontal, size)	
    }
    
    @_optimize(none) func vInset(_ size: CGFloat) -> CGFloat {
        inset(.vertical, size)
    }
    
    @_optimize(none) func vInset<T: UINumericType>(_ size: T) -> CGFloat {
        inset(.vertical, size)
    }
}
