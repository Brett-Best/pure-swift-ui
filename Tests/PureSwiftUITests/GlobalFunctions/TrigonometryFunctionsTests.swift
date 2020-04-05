//
//  TrigonometryFunctionsTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class TrigonometryFunctionsTests: XCTestCase {
    
    
}

// MARK: ----- GENERAL

extension TrigonometryFunctionsTests {
    
    @_optimize(none) func testSin() {
        XCTAssertEqual(sin(30.degrees), sin(Angle.degrees(30).radians))
    }

    @_optimize(none) func testCos() {
        XCTAssertEqual(cos(30.degrees), cos(Angle.degrees(30).radians))
    }

    @_optimize(none) func testTan() {
        XCTAssertEqual(tan(30.degrees), tan(Angle.degrees(30).radians))
    }
}

