//
//  Double+AngleTests.swift
//
//
//  Created by Adam Fordyce on 26/11/2019.
//

import XCTest
@testable import PureSwiftUI

class DoubleAngleExtensionsTests: XCTestCase {
    
    let degreesValue: Double = 45
    let radiansValue: Double = 2
    let inverseValue: Double = 1
    
    @_optimize(none) func testDoubleAsDegrees() {
        let expectedResult = Angle.degrees(degreesValue)
        let result = Double(degreesValue).degrees
        XCTAssertEqual(result, expectedResult)
    }
    
    @_optimize(none) func testDoubleAsRadians() {
        let expectedResult = Angle.radians(radiansValue)
        let result = Double(radiansValue).radians
        XCTAssertEqual(result, expectedResult)
    }
    
    @_optimize(none) func testDoubleDegreesAsRadians() {
        let expectedResult = Angle.radians(Angle.degrees(degreesValue).radians)
        let result = Double(degreesValue).degreesAsRadians
        XCTAssertEqual(result, expectedResult)
    }
    
    @_optimize(none) func testDoubleRadiansAsDegrees() {
        let expectedResult = Angle.degrees(Angle.radians(radiansValue).degrees)
        let result = Double(radiansValue).radiansAsDegrees
        XCTAssertEqual(result, expectedResult)
    }
    
    @_optimize(none) func testDoubleACos() {
        let expectedResult = acos(inverseValue)
        let result = Double(inverseValue).acos.radians
        XCTAssertEqual(result, expectedResult)
    }
    
    @_optimize(none) func testDoubleASin() {
        let expectedResult = asin(inverseValue)
        let result = Double(inverseValue).asin.radians
        XCTAssertEqual(result, expectedResult)
    }
    
    @_optimize(none) func testDoubleATan() {
        let expectedResult = atan(inverseValue)
        let result = Double(inverseValue).atan.radians
        XCTAssertEqual(result, expectedResult)
    }
}
