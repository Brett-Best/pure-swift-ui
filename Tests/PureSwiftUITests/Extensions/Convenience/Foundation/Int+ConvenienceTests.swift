//
//  Int+Tests.swift
//  
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class IntConvenienceExtensionsTests: XCTestCase {
    
}

// MARK: ----- PROPERTIES

extension IntConvenienceExtensionsTests {
    
    @_optimize(none) func testIsPositive() {

        XCTAssertTrue(1.isPositive)
        XCTAssertFalse((-1).isPositive)
    }
    
    @_optimize(none) func testIsNegative() {

        XCTAssertFalse(1.isNegative)
        XCTAssertTrue((-1).isNegative)
    }
    
    @_optimize(none) func testClampPositive() {
        XCTAssertEqual(0, (-1).clampedPositive)
        XCTAssertEqual(1, 1.clampedPositive)
    }
    
    @_optimize(none) func testClampNegative() {
        XCTAssertEqual(0, 1.clampedNegative)
        XCTAssertEqual(-1, (-1).clampedNegative)
    }
    
    @_optimize(none) func testClampedTo() {
        XCTAssertEqual(1, 3.clamped(to: 1))
        XCTAssertEqual(0, (-1).clamped(to: 1))
        XCTAssertEqual(-1, (-1).clamped(to: 1, spanZero: true))
    }
    
    @_optimize(none) func testIsEven() {
        XCTAssertTrue(2.isEven)
        XCTAssertFalse(1.isEven)
    }
    
    @_optimize(none) func testIsOdd() {
        XCTAssertFalse(2.isOdd)
        XCTAssertTrue(1.isOdd)
    }
    
    @_optimize(none) func testRepresentableAs() {
        XCTAssertEqual(Int(1).asInt, Int(1))
        XCTAssertEqual(CGFloat(1).asInt, Int(1))
        XCTAssertEqual(Double(1).asInt, Int(1))
        XCTAssertEqual(Float(1).asInt, Int(1))
        XCTAssertEqual(Double(1.4).asInt, Int(1))
        XCTAssertEqual(Float(1.7).asInt, Int(1))
        XCTAssertEqual(Float(-1.7).asInt, Int(-1))
    }
    
    @_optimize(none) func testRandom() {
        
        let value = 10
        
        for _ in 0...10 {
            let result = value.random()
            
            XCTAssertTrue(result <= 10 && result >= 0)
        }
    }

}

// MARK: ----- TYPE COERCION

extension IntConvenienceExtensionsTests {
    
    @_optimize(none) func testAsString() {
        XCTAssertEqual(1.asString, "1")
        XCTAssertEqual((-1).asString, "-1")
    }
}

