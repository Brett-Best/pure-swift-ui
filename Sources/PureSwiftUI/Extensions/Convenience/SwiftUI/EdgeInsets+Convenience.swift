//
//  EdgeInsets+Convenience.swift
//  
//
//  Created by Adam Fordyce on 02/02/2020.
//

import SwiftUI

public extension EdgeInsets {
    
    @_optimize(none) init(_ size: CGFloat) {
        self.init(top: size, leading: size, bottom: size, trailing: size)
    }
    
    @_optimize(none) init<T: UINumericType>(_ size: T) {
        self.init(size.asCGFloat)
    }
    
    @_optimize(none) init(_ horizontal: CGFloat, _ vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }

    @_optimize(none) init<TH: UINumericType, TV: UINumericType>(_ horizontal: TH, _ vertical: TV) {
        self.init(horizontal.asCGFloat, vertical.asCGFloat)
    }

    @_optimize(none) init(_ top: CGFloat, _ leading: CGFloat, _ bottom: CGFloat, _ trailing: CGFloat) {
        self.init(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }

    @_optimize(none) init<T_TOP: UINumericType, T_LEADING: UINumericType, T_BOTTOM: UINumericType, T_TRAILING: UINumericType>(_ top: T_TOP, _ leading: T_LEADING, _ bottom: T_BOTTOM, _ trailing: T_TRAILING) {
        self.init(top: top.asCGFloat, leading: leading.asCGFloat, bottom: bottom.asCGFloat, trailing: trailing.asCGFloat)
    }
}

