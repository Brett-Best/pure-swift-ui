//
//  String+ConvenienceTests.swift
//
//
//  Created by Adam Fordyce on 27/11/2019.
//

import XCTest
@testable import PureSwiftUI

class StringConvenienceExtensionsTests: XCTestCase {
    
}


// MARK: ----- NOT EMPTY

extension StringConvenienceExtensionsTests {
    @_optimize(none) func testIsNotEmpty() {
        XCTAssertTrue("hello".isNotEmpty)
    }
}
