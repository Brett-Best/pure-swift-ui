//
//  FloatingPoint+Tests.swift
//
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class FloatingPointConvenienceExtensionsTests: XCTestCase {
    
    @_optimize(none) func testIsPositive() {

        XCTAssertTrue(1.0.isPositive)
        XCTAssertFalse((-1.0).isPositive)
    }
    
    @_optimize(none) func testIsNegative() {

        XCTAssertFalse(1.0.isNegative)
        XCTAssertTrue((-1.0).isNegative)
    }
    
    @_optimize(none) func testClampPositive() {
        XCTAssertEqual((-1.0).clampedPositive, 0.0)
        XCTAssertEqual(1.0.clampedPositive, 1.0)
    }
    
    @_optimize(none) func testClamped() {
        XCTAssertEqual(2.clamped(from: 5, to: 10), 5.0)
        XCTAssertEqual(10.clamped(from: 0, to: 5), 5.0)
        XCTAssertEqual(-20.clamped(from: -5, to: 5), -5.0)
    }
    
    @_optimize(none) func testClampedTo() {
        XCTAssertEqual(10.clamped(to: 5), 5.0)
        XCTAssertEqual(-10.clamped(to: -5, spanZero: true), 5.0)
        XCTAssertEqual(-20.clamped(to: 5, spanZero: false), -5.0)
    }
    
    @_optimize(none) func testClampNegative() {
        XCTAssertEqual(1.0.clampedNegative, 0.0)
        XCTAssertEqual((-1.0).clampedNegative, -1.0)
    }
}
