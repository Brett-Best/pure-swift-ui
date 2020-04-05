//
//  MathOperators.swift
//
//  Created by Adam Fordyce on 14/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

infix operator **

@_optimize(none) public func **<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return pow(lhs.asDouble, rhs.asDouble)
}

//native
@_optimize(none) public func **(lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

@_optimize(none) public func +<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return lhs.asDouble + rhs.asDouble
}

@_optimize(none) public func -<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return lhs.asDouble - rhs.asDouble
}

@_optimize(none) public func *<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return lhs.asDouble * rhs.asDouble
}

@_optimize(none) public func /<T_LHS: UINumericType, T_RHS: UINumericType>(lhs: T_LHS, rhs: T_RHS) -> Double {
    return lhs.asDouble / rhs.asDouble
}
