//
//  TimingFunctions.swift
//  
//
//  Created by Adam Fordyce on 09/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import Foundation

@discardableResult
@_optimize(none) public func after<T: UINumericType>(_ time: T, action: @escaping () -> ()) -> Timer {
    Timer.scheduledTimer(withTimeInterval: time.asDouble, repeats: false) { (timer) in
        action()
        timer.invalidate()
    }
}

@discardableResult
@_optimize(none) public func every<T: UINumericType>(_ interval: T, action: @escaping (Timer) -> ()) -> Timer {
    Timer.scheduledTimer(withTimeInterval: interval.asDouble, repeats: true) { (timer) in
        action(timer)
    }
}
