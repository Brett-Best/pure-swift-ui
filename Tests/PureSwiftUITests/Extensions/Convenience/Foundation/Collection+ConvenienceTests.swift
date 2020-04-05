//
//  Float+AngleTests.swift
//
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class CollectionConvenienceTests: XCTestCase {
    
    
}

// MARK: ----- GENERAL

extension CollectionConvenienceTests {
    
    @_optimize(none) func testIsNotEmpty() {
        XCTAssertTrue([1].isNotEmpty)
    }
}
