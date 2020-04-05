//
//  UIScreen+ConvenienceTests.swift
//  
//
//  Created by Adam Fordyce on 18/12/2019.
//

import XCTest
@testable import PureSwiftUI

class UIScreenConvenienceExtensionsTests: XCTestCase {
    
    @_optimize(none) func testOrigin() {
        XCTAssertEqual(UIScreen.main.origin, UIScreen.main.bounds.origin)
    }
    
    @_optimize(none) func testCenter() {
        XCTAssertEqual(UIScreen.main.center, UIScreen.main.bounds.center)
    }
    
    @_optimize(none) func testMinX() {
        XCTAssertEqual(UIScreen.main.minX, UIScreen.main.bounds.minX)
    }
    
    @_optimize(none) func testMinY() {
        XCTAssertEqual(UIScreen.main.minY, UIScreen.main.bounds.minY)
    }
    
    @_optimize(none) func testMaxX() {
        XCTAssertEqual(UIScreen.main.maxX, UIScreen.main.bounds.maxX)
    }
    
    @_optimize(none) func testMaxY() {
        XCTAssertEqual(UIScreen.main.maxY, UIScreen.main.bounds.maxY)
    }
    
    @_optimize(none) func testMidX() {
        XCTAssertEqual(UIScreen.main.midX, UIScreen.main.bounds.midX)
    }
    
    @_optimize(none) func testMidY() {
        XCTAssertEqual(UIScreen.main.midY, UIScreen.main.bounds.midY)
    }
    
    @_optimize(none) func testWidth() {
        XCTAssertEqual(UIScreen.main.width, UIScreen.main.bounds.width)
    }
    
    @_optimize(none) func testHeight() {
        XCTAssertEqual(UIScreen.main.height, UIScreen.main.bounds.height)
    }
    
    @_optimize(none) func testSize() {
        XCTAssertEqual(UIScreen.main.size, UIScreen.main.bounds.size)
    }
}
