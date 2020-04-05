//
//  GridLayoutGuideTests.swift
//  
//
//  Created by Adam Fordyce on 06/02/2020.
//

import XCTest
@testable import PureSwiftUI

class GridLayoutGuideTests: BaseLayoutGuideTests {
    
}

// MARK: ----- PROPERTIES {

extension GridLayoutGuideTests {
    
    @_optimize(none) func testForInvalidColumnNumber() {
        let grid = LayoutGuide.grid(rect, columns: 0, rows: 2)
        XCTAssertEqual(grid.xCount, 1)
    }
    
    @_optimize(none) func testForInvalidRowNumber() {
        let grid = LayoutGuide.grid(rect, columns: 2, rows: 0)
        XCTAssertEqual(grid.yCount, 1)
    }
    
    @_optimize(none) func testProperties() {
        
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        XCTAssertEqual(grid.xCount, 10)
        XCTAssertEqual(grid.yCount, 6)
        XCTAssertEqual(grid.origin, rect.topLeading)
        
        grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        XCTAssertEqual(grid.xCount, 3)
        XCTAssertEqual(grid.yCount, 6)
        XCTAssertEqual(grid.origin, rect.topLeading)
        
        grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        XCTAssertEqual(grid.xCount, 3)
        XCTAssertEqual(grid.yCount, 3)
        XCTAssertEqual(grid.origin, rect.topLeading)
        
        grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        XCTAssertEqual(grid.xCount, 10)
        XCTAssertEqual(grid.yCount, 3)
        XCTAssertEqual(grid.origin, rect.topLeading)
    }
}

// MARK: ----- ANGLE FOR POINT

extension GridLayoutGuideTests {
    
    @_optimize(none) func testDeprecatedAngleForPoint() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        
        XCTAssertEqual(grid.angle(10, 0), 90.degrees)
        XCTAssertEqual(grid.angle(0, 10), 180.degrees)
        
        XCTAssertEqual(grid.angle(0, 3, origin: rect.center), 270.degrees)
        XCTAssertEqual(grid.angle(5, 0, origin: rect.center), 0.degrees)
        XCTAssertEqual(grid.angle(10, 3, origin: rect.center), 90.degrees)
        XCTAssertEqual(grid.angle(5, 6, origin: rect.center), 180.degrees)
    }
    
    @_optimize(none) func testAngleForPoint() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        
        XCTAssertEqual(grid.angleTo(10, 0), 90.degrees)
        XCTAssertEqual(grid.angleTo(0, 10), 180.degrees)
        
        XCTAssertEqual(grid.angleTo(0, 3, from: rect.center), 270.degrees)
        XCTAssertEqual(grid.angleTo(5, 0, from: rect.center), 0.degrees)
        XCTAssertEqual(grid.angleTo(10, 3, from: rect.center), 90.degrees)
        XCTAssertEqual(grid.angleTo(5, 6, from: rect.center), 180.degrees)
    }
}

// MARK: ----- RADIUS FOR POINT

extension GridLayoutGuideTests {
    
    @_optimize(none) func testDeprecatedRadiusForPoint() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        
        XCTAssertEqual(grid.radius(10, 0), rect.width)
        XCTAssertEqual(grid.radius(0, 6), rect.height)
        XCTAssertEqual(grid.radius(0, 3), rect.halfHeight)
        XCTAssertEqual(grid.radius(5, 0), rect.halfWidth)
        
        XCTAssertEqual(grid.radius(0, 3, origin: rect.center), rect.halfWidth)
        XCTAssertEqual(grid.radius(5, 0, origin: rect.center), rect.halfHeight)
        XCTAssertEqual(grid.radius(10, 3, origin: rect.center), rect.halfWidth)
        XCTAssertEqual(grid.radius(5, 6, origin: rect.center), rect.halfHeight)
    }
    
    @_optimize(none) func testRadiusForPoint() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        
        XCTAssertEqual(grid.radiusTo(10, 0), rect.width)
        XCTAssertEqual(grid.radiusTo(0, 6), rect.height)
        XCTAssertEqual(grid.radiusTo(0, 3), rect.halfHeight)
        XCTAssertEqual(grid.radiusTo(5, 0), rect.halfWidth)
        
        XCTAssertEqual(grid.radiusTo(0, 3, from: rect.center), rect.halfWidth)
        XCTAssertEqual(grid.radiusTo(5, 0, from: rect.center), rect.halfHeight)
        XCTAssertEqual(grid.radiusTo(10, 3, from: rect.center), rect.halfWidth)
        XCTAssertEqual(grid.radiusTo(5, 6, from: rect.center), rect.halfHeight)
    }
}

// MARK: ----- EQUIDISTANT POINT TESTS

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsForEquidistant() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        assertEqual(grid[0, 0], (x, y))
        assertEqual(grid[10, 6], rect.extent)
        assertEqual(grid[10, 0], rect.topTrailing)
        assertEqual(grid[0, 6], rect.bottomLeading)
        assertEqual(grid[5, 3], rect.center)
        assertEqual(grid[10, 3], rect.trailing)
        assertEqual(grid[5, 6], rect.bottom)
        assertEqual(grid[0, 3], rect.leading)
        assertEqual(grid[5, 0], rect.top)
    }
    
    @_optimize(none) func testPointsForEquidistantReframed() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        assertEqual(grid[0, 0], bottomRightRect.origin)
        assertEqual(grid[10, 6], bottomRightRect.extent)
        assertEqual(grid[10, 0], bottomRightRect.topTrailing)
        assertEqual(grid[0, 6], bottomRightRect.bottomLeading)
        assertEqual(grid[5, 3], bottomRightRect.center)
        assertEqual(grid[10, 3], bottomRightRect.trailing)
        assertEqual(grid[5, 6], bottomRightRect.bottom)
        assertEqual(grid[0, 3], bottomRightRect.leading)
        assertEqual(grid[5, 0], bottomRightRect.top)
    }
    
    @_optimize(none) func testPointsForEquidistantWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[0, 0, origin: rect.center], offsetRect.origin)
        assertEqual(grid[10, 6, origin: rect.center], offsetRect.extent)
        assertEqual(grid[10, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[0, 6, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[5, 3, origin: rect.center], offsetRect.center)
        assertEqual(grid[10, 3, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[5, 6, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, 3, origin: rect.center], offsetRect.leading)
        assertEqual(grid[5, 0, origin: rect.center], offsetRect.top)
    }
    
    @_optimize(none) func testOutOfBoundsForEquidistant() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: 6)
        assertEqual(grid[-10, -6], (x - width, y - height))
        assertEqual(grid[20, 12], CGRect(CGPoint(x, y), rect.sizeScaled(2)).extent)
    }
}

// MARK: -----  RELATIVE POINT TESTS

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsForRelative() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        assertEqual(grid[0, 0], (x, y))
        assertEqual(grid[2, 2], rect.extent)
        assertEqual(grid[2, 0], rect.topTrailing)
        assertEqual(grid[0, 2], rect.bottomLeading)
        assertEqual(grid[1, 1], rect.center)
        assertEqual(grid[2, 1], rect.trailing)
        assertEqual(grid[1, 2], rect.bottom)
        assertEqual(grid[0, 1], rect.leading)
        assertEqual(grid[1, 0], rect.top)
    }
    
    @_optimize(none) func testPointsForRelativeReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        assertEqual(grid[0, 0], bottomRightRect.origin)
        assertEqual(grid[2, 2], bottomRightRect.extent)
        assertEqual(grid[2, 0], bottomRightRect.topTrailing)
        assertEqual(grid[0, 2], bottomRightRect.bottomLeading)
        assertEqual(grid[1, 1], bottomRightRect.center)
        assertEqual(grid[2, 1], bottomRightRect.trailing)
        assertEqual(grid[1, 2], bottomRightRect.bottom)
        assertEqual(grid[0, 1], bottomRightRect.leading)
        assertEqual(grid[1, 0], bottomRightRect.top)
    }
    
    @_optimize(none) func testPointsForRelativeWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[0, 0, origin: rect.center], rect.center)
        assertEqual(grid[2, 2, origin: rect.center], offsetRect.extent)
        assertEqual(grid[2, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[0, 2, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[1, 1, origin: rect.center], offsetRect.center)
        assertEqual(grid[2, 1, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[1, 2, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, 1, origin: rect.center], offsetRect.leading)
        assertEqual(grid[1, 0, origin: rect.center], offsetRect.top)
    }
    
    @_optimize(none) func testOutOfBoundsForRelative() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        assertEqual(grid[-10, -6], rect.origin)
        assertEqual(grid[6, 6], rect.extent)
    }
}

// MARK: ----- EQUIDISTANT X  RELATIVE Y POINT TESTS

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsForEquidistantXRelativeY() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        assertEqual(grid[0, 0], (x, y))
        assertEqual(grid[10, 2], rect.extent)
        assertEqual(grid[10, 0], rect.topTrailing)
        assertEqual(grid[0, 2], rect.bottomLeading)
        assertEqual(grid[5, 1], rect.center)
        assertEqual(grid[10, 1], rect.trailing)
        assertEqual(grid[5, 2], rect.bottom)
        assertEqual(grid[0, 1], rect.leading)
        assertEqual(grid[5, 0], rect.top)
    }
    
    @_optimize(none) func testPointsForEquidistantXRelativeYReframed() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .center)
        let offset = bottomRightRect.sizeScaled(0.5)
        assertEqual(grid[0, 0], bottomRightRect.center)
        assertEqual(grid[10, 2], bottomRightRect.bottomTrailing.offset(offset))
        assertEqual(grid[10, 0], bottomRightRect.topTrailing.offset(offset))
        assertEqual(grid[0, 2], bottomRightRect.bottomLeading.offset(offset))
        assertEqual(grid[5, 1], bottomRightRect.center.offset(offset))
        assertEqual(grid[10, 1], bottomRightRect.trailing.offset(offset))
        assertEqual(grid[5, 2], bottomRightRect.bottom.offset(offset))
        assertEqual(grid[0, 1], bottomRightRect.leading.offset(offset))
        assertEqual(grid[5, 0], bottomRightRect.top.offset(offset))
    }
    
    @_optimize(none) func testPointsForEquidistantXRelativeYWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[0, 0, origin: rect.center], offsetRect.origin)
        assertEqual(grid[10, 2, origin: rect.center], offsetRect.extent)
        assertEqual(grid[10, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[0, 2, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[5, 1, origin: rect.center], offsetRect.center)
        assertEqual(grid[10, 1, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[5, 2, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, 1, origin: rect.center], offsetRect.leading)
        assertEqual(grid[5, 0, origin: rect.center], offsetRect.top)
    }
    
    @_optimize(none) func testOutOfBoundsForEquidistantXRelativeY() {
        var grid = LayoutGuide.grid(rect, columns: 10, rows: [0, 0.5, 1])
        assertEqual(grid[-10, -6], (x - width, rect.origin.y))
        assertEqual(grid[20, 12], (x + width * 2, rect.extent.y))
    }
}

// MARK: -----  RELATIVE X EQUIDISTANT Y POINT TESTS

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsForRelativeXEquidistantY() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        assertEqual(grid[0, 0], (x, y))
        assertEqual(grid[2, 6], rect.extent)
        assertEqual(grid[2, 0], rect.topTrailing)
        assertEqual(grid[0, 6], rect.bottomLeading)
        assertEqual(grid[1, 3], rect.center)
        assertEqual(grid[2, 3], rect.trailing)
        assertEqual(grid[1, 6], rect.bottom)
        assertEqual(grid[0, 3], rect.leading)
        assertEqual(grid[1, 0], rect.top)
    }
    
    @_optimize(none) func testPointsForRelativeXEquidistantYReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        assertEqual(grid[0, 0], rect.center)
        assertEqual(grid[2, 6], bottomRightRect.extent)
        assertEqual(grid[2, 0], bottomRightRect.topTrailing)
        assertEqual(grid[0, 6], bottomRightRect.bottomLeading)
        assertEqual(grid[1, 3], bottomRightRect.center)
        assertEqual(grid[2, 3], bottomRightRect.trailing)
        assertEqual(grid[1, 6], bottomRightRect.bottom)
        assertEqual(grid[0, 3], bottomRightRect.leading)
        assertEqual(grid[1, 0], bottomRightRect.top)
    }
    
    @_optimize(none) func testPointsForRelativeXEquidistantYWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        assertEqual(grid[0, 0, origin: rect.center], offsetRect.origin)
        assertEqual(grid[2, 6, origin: rect.center], offsetRect.extent)
        assertEqual(grid[2, 0, origin: rect.center], offsetRect.topTrailing)
        assertEqual(grid[0, 6, origin: rect.center], offsetRect.bottomLeading)
        assertEqual(grid[1, 3, origin: rect.center], offsetRect.center)
        assertEqual(grid[2, 3, origin: rect.center], offsetRect.trailing)
        assertEqual(grid[1, 6, origin: rect.center], offsetRect.bottom)
        assertEqual(grid[0, 3, origin: rect.center], offsetRect.leading)
        assertEqual(grid[1, 0, origin: rect.center], offsetRect.top)
    }
    
    @_optimize(none) func testOutOfBoundsForRelativeXEquidistantY() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: 6)
        assertEqual(grid[-10, -6], (x, y - height))
        assertEqual(grid[20, 12], (rect.extent.x, y + height * 2))
    }
}

// MARK: ----- OFFSET GRID

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsWithOffset() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offset = CGPoint(5, 10)
        
        var offsetGrid = grid.offset(offset, factor: 0)
        assertEqual(offsetGrid[0, 0], CGPoint(x, y))
        assertEqual(offsetGrid[2, 2], rect.extent)
        assertEqual(offsetGrid[2, 0], rect.topTrailing)
        
        offsetGrid = grid.offset(offset, factor: 0.5)
        assertEqual(offsetGrid[0, 2], rect.bottomLeading + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[1, 1], rect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[2, 1], rect.trailing + offset.asCGPoint.scaled(0.5))
        
        offsetGrid = grid.offset(10, factor: 0.5)
        assertEqual(offsetGrid[0, 2], rect.bottomLeading + CGPoint(10).scaled(0.5))
        assertEqual(offsetGrid[1, 1], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(offsetGrid[2, 1], rect.trailing + CGPoint(10).scaled(0.5))
        
        offsetGrid = grid.offset(offset)
        assertEqual(offsetGrid[1, 2], rect.bottom + offset.asCGPoint)
        assertEqual(offsetGrid[0, 1], rect.leading + offset.asCGPoint)
        assertEqual(offsetGrid[1, 0], rect.top + offset.asCGPoint)
    }
    
    @_optimize(none) func testPointsWithOffsetForRelativeReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        let offset = CGPoint(5, 10)
        
        var offsetGrid = grid.offset(offset, factor: 0)
        assertEqual(offsetGrid[0, 0], bottomRightRect.origin)
        assertEqual(offsetGrid[2, 2], bottomRightRect.extent)
        assertEqual(offsetGrid[2, 0], bottomRightRect.topTrailing)
        
        offsetGrid = grid.offset(offset, factor: 0.5)
        assertEqual(offsetGrid[0, 2], bottomRightRect.bottomLeading + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[1, 1], bottomRightRect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[2, 1], bottomRightRect.trailing + offset.asCGPoint.scaled(0.5))
        
        offsetGrid = grid.offset(offset)
        assertEqual(offsetGrid[1, 2], bottomRightRect.bottom + offset.asCGPoint)
        assertEqual(offsetGrid[0, 1], bottomRightRect.leading + offset.asCGPoint)
        assertEqual(offsetGrid[1, 0], bottomRightRect.top + offset.asCGPoint)
    }
    
    @_optimize(none) func testPointsWithOffsetForRelativeWithOrigin() {
        let baseGrid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offsetRect = rect.offset(rect.sizeScaled(0.5))
        let offset = CGPoint(5, 10)
        
        var offsetGrid = baseGrid.offset(offset, factor: 0)
        assertEqual(offsetGrid[0, 0, origin: rect.center], rect.center)
        assertEqual(offsetGrid[2, 2, origin: rect.center], offsetRect.extent)
        assertEqual(offsetGrid[2, 0, origin: rect.center], offsetRect.topTrailing)
        
        offsetGrid = baseGrid.offset(offset, factor: 0.5)
        assertEqual(offsetGrid[0, 2, origin: rect.center], offsetRect.bottomLeading + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[1, 1, origin: rect.center], offsetRect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(offsetGrid[2, 1, origin: rect.center], offsetRect.trailing + offset.asCGPoint.scaled(0.5))
        
        offsetGrid = baseGrid.offset(offset)
        assertEqual(offsetGrid[1, 2, origin: rect.center], offsetRect.bottom + offset.asCGPoint)
        assertEqual(offsetGrid[0, 1, origin: rect.center], offsetRect.leading + offset.asCGPoint)
        assertEqual(offsetGrid[1, 0, origin: rect.center], offsetRect.top + offset.asCGPoint)
    }
    
    @_optimize(none) func testPointsWithOffsetWithConfig() {
        let offset = CGPoint(5, 10)
        let baseConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        var grid = baseConfig
            .offset(offset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(grid[0, 2], rect.bottomLeading + offset.asCGPoint.scaled(0.5))
        assertEqual(grid[1, 1], rect.center + offset.asCGPoint.scaled(0.5))
        assertEqual(grid[2, 1], rect.trailing + offset.asCGPoint.scaled(0.5))
        
        grid = baseConfig
            .offset(10, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(grid[0, 2], rect.bottomLeading + CGPoint(10).scaled(0.5))
        assertEqual(grid[1, 1], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(grid[2, 1], rect.trailing + CGPoint(10).scaled(0.5))
        
        grid = baseConfig
            .offset(offset)
            .layout(in: rect)
        
        assertEqual(grid[1, 2], rect.bottom + offset.asCGPoint)
        assertEqual(grid[0, 1], rect.leading + offset.asCGPoint)
        assertEqual(grid[1, 0], rect.top + offset.asCGPoint)
    }
}

// MARK: ----- REFRAMED WITH OFFSET

extension GridLayoutGuideTests {
    
    @_optimize(none) func testDeprecatedPointsWithReframedOffset() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offset = CGPoint(5, 10)
        
        var gridReframed = grid.reframed(offset: offset)
        assertEqual(gridReframed[0, 0], rect.origin.offset(offset))
        assertEqual(gridReframed[2, 2], rect.extent.offset(offset))
        assertEqual(gridReframed[2, 0], rect.topTrailing.offset(offset))
        
        gridReframed = grid.reframed(offset: offset.asCGSize)
        assertEqual(gridReframed[0, 0], rect.origin.offset(offset))
        assertEqual(gridReframed[2, 2], rect.extent.offset(offset))
        assertEqual(gridReframed[2, 0], rect.topTrailing.offset(offset))
        
        gridReframed = grid.reframed(offset: offset.asCGVector)
        assertEqual(gridReframed[0, 0], rect.origin.offset(offset))
        assertEqual(gridReframed[2, 2], rect.extent.offset(offset))
        assertEqual(gridReframed[2, 0], rect.topTrailing.offset(offset))
    }
}

// MARK: ----- OFFSET GRID FROM TO

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsWithOffsetFromTo() {
        let baseGrid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offsetFrom = CGPoint(0, 0)
        let offsetTo = CGPoint(5, 10)
        
        var gridOffset = baseGrid.offset(from: offsetFrom, to: offsetTo, factor: 0)
        assertEqual(gridOffset[0, 0], CGPoint(x, y))
        assertEqual(gridOffset[2, 2], rect.extent)
        assertEqual(gridOffset[2, 0], rect.topTrailing)
        
        gridOffset = baseGrid.offset(from: offsetFrom, to: offsetTo, factor: 0.5)
        assertEqual(gridOffset[0, 2], rect.bottomLeading + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(gridOffset[1, 1], rect.center + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(gridOffset[2, 1], rect.trailing + offsetTo.asCGPoint.scaled(0.5))
        
        gridOffset = baseGrid.offset(from: 0, to: 10, factor: 0.5)
        assertEqual(gridOffset[0, 2], rect.bottomLeading + CGPoint(10).scaled(0.5))
        assertEqual(gridOffset[1, 1], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(gridOffset[2, 1], rect.trailing + CGPoint(10).scaled(0.5))
        
        gridOffset = baseGrid.offset(from: offsetFrom, to: offsetTo, factor: 1)
        assertEqual(gridOffset[1, 2], rect.bottom + offsetTo.asCGPoint)
        assertEqual(gridOffset[0, 1], rect.leading + offsetTo.asCGPoint)
        assertEqual(gridOffset[1, 0], rect.top + offsetTo.asCGPoint)
    }
    
    @_optimize(none) func testPointsWithOffsetFromToWithConfig() {
        let baseConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offsetFrom = CGPoint(0, 0)
        let offsetTo = CGPoint(5, 10)
        
        var grid = baseConfig
            .offset(from: offsetFrom, to: offsetTo, factor: 0)
            .layout(in: rect)
        
        assertEqual(grid[0, 0], CGPoint(x, y))
        assertEqual(grid[2, 2], rect.extent)
        assertEqual(grid[2, 0], rect.topTrailing)
        
        grid = baseConfig
            .offset(from: offsetFrom, to: offsetTo, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(grid[0, 2], rect.bottomLeading + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(grid[1, 1], rect.center + offsetTo.asCGPoint.scaled(0.5))
        assertEqual(grid[2, 1], rect.trailing + offsetTo.asCGPoint.scaled(0.5))
        
        grid = baseConfig
            .offset(from: 0, to: 10, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(grid[0, 2], rect.bottomLeading + CGPoint(10).scaled(0.5))
        assertEqual(grid[1, 1], rect.center + CGPoint(10).scaled(0.5))
        assertEqual(grid[2, 1], rect.trailing + CGPoint(10).scaled(0.5))
        
        grid = baseConfig.offset(from: offsetFrom, to: offsetTo, factor: 1)
            .layout(in: rect)
        
        assertEqual(grid[1, 2], rect.bottom + offsetTo.asCGPoint)
        assertEqual(grid[0, 1], rect.leading + offsetTo.asCGPoint)
        assertEqual(grid[1, 0], rect.top + offsetTo.asCGPoint)
    }
}

// MARK: ----- OFFSET IN X AND Y FROM TO

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsWithXOffsetFromTo() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let xOffset: CGFloat = 10
        
        var polarOffset = grid.xOffset(from: 0, to: xOffset, factor: 0)
        assertEqual(polarOffset[0, 0], rect.topLeading)
        
        polarOffset = grid.xOffset(from: 0, to: xOffset, factor: 0.5)
        assertEqual(polarOffset[1, 1], rect.center.xOffset(xOffset * 0.5))
        
        polarOffset = grid.xOffset(from: 0, to: xOffset, factor: 1)
        assertEqual(polarOffset[2, 2], rect.bottomTrailing.xOffset(xOffset))
    }
    
    @_optimize(none) func testPointsWithXOffsetFromToWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let xOffset: CGFloat = 10
        
        var polarOffset = gridConfig
            .xOffset(from: 0, to: xOffset, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.topLeading)
        
        polarOffset = gridConfig
            .xOffset(from: 0, to: xOffset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[1, 1], rect.center.xOffset(xOffset * 0.5))
        
        polarOffset = gridConfig
            .xOffset(from: 0, to: xOffset, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarOffset[2, 2], rect.bottomTrailing.xOffset(xOffset))
    }
    
    @_optimize(none) func testPointsWithYOffsetFromTo() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let yOffset: CGFloat = 10
        
        var polarOffset = grid.yOffset(from: 0, to: yOffset, factor: 0)
        assertEqual(polarOffset[0, 0], rect.topLeading)
        
        polarOffset = grid.yOffset(from: 0, to: yOffset, factor: 0.5)
        assertEqual(polarOffset[1, 1], rect.center.yOffset(yOffset * 0.5))
        
        polarOffset = grid.yOffset(from: 0, to: yOffset, factor: 1)
        assertEqual(polarOffset[2, 2], rect.bottomTrailing.yOffset(yOffset))
    }
    
    @_optimize(none) func testPointsWithYOffsetFromToWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let yOffset: CGFloat = 10
        
        var polarOffset = gridConfig
            .yOffset(from: 0, to: yOffset, factor: 0)
            .layout(in: rect)
        
        assertEqual(polarOffset[0, 0], rect.topLeading)
        
        polarOffset = gridConfig
            .yOffset(from: 0, to: yOffset, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(polarOffset[1, 1], rect.center.yOffset(yOffset * 0.5))
        
        polarOffset = gridConfig
            .yOffset(from: 0, to: yOffset, factor: 1)
            .layout(in: rect)
        
        assertEqual(polarOffset[2, 2], rect.bottomTrailing.yOffset(yOffset))
    }
}

// MARK: ----- ROTATE GRID

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsWithRotation() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridRotated = grid.rotated(180.degrees, factor: 0)
        assertEqual(gridRotated[0, 0], CGPoint(x, y))
        assertEqual(gridRotated[2, 2], rect.extent)
        assertEqual(gridRotated[2, 0], rect.topTrailing)
        
        gridRotated = grid.rotated(180.degrees, factor: 0.5)
        assertEqual(gridRotated[1, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(gridRotated[0, 1], rect.center.yOffset(-rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
        
        gridRotated = grid.rotated(180.degrees)
        assertEqual(gridRotated[1, 0], rect.bottom)
        assertEqual(gridRotated[0, 1], rect.center.xOffset(rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
    }
    
    @_optimize(none) func testPointsWithRotationWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridRotated = gridConfig
            .rotated(180.degrees, factor: 0)
            .layout(in: rect)
        
        assertEqual(gridRotated[0, 0], CGPoint(x, y))
        assertEqual(gridRotated[2, 2], rect.extent)
        assertEqual(gridRotated[2, 0], rect.topTrailing)
        
        gridRotated = gridConfig
            .rotated(180.degrees, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridRotated[1, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(gridRotated[0, 1], rect.center.yOffset(-rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
        
        gridRotated = gridConfig
            .rotated(180.degrees)
            .layout(in: rect)
        
        assertEqual(gridRotated[1, 0], rect.bottom)
        assertEqual(gridRotated[0, 1], rect.center.xOffset(rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
    }
    
    @_optimize(none) func testPointsWithRotationForRelativeReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        
        var gridRotated = grid.rotated(180.degrees, factor: 0)
        assertEqual(gridRotated[0, 0], bottomRightRect.origin)
        assertEqual(gridRotated[2, 2], bottomRightRect.extent)
        assertEqual(gridRotated[2, 0], bottomRightRect.topTrailing)
        
        gridRotated = grid.rotated(180.degrees, factor: 0.5)
        assertEqual(gridRotated[1, 0], bottomRightRect.center.xOffset(bottomRightRect.halfHeight))
        assertEqual(gridRotated[0, 1], bottomRightRect.center.yOffset(-bottomRightRect.halfWidth))
        assertEqual(gridRotated[1, 1], bottomRightRect.center)
        
        gridRotated = grid.rotated(180.degrees)
        assertEqual(gridRotated[1, 0], bottomRightRect.bottom)
        assertEqual(gridRotated[0, 1], bottomRightRect.center.xOffset(bottomRightRect.halfWidth))
        assertEqual(gridRotated[1, 1], bottomRightRect.center)
    }
    
    @_optimize(none) func testPointsWithRotationForRelativeWithOrigin() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offset = CGPoint.zero.moveOrigin(in: rect.size, origin: .center)
        
        var gridRotated = grid.rotated(180.degrees, factor: 0)
        assertEqual(gridRotated[0, 0, origin: rect.center], rect.center)
        assertEqual(gridRotated[1, 0, origin: rect.center], rect.trailing)
        assertEqual(gridRotated[1, 1, origin: rect.center], rect.bottomTrailing)
        
        gridRotated = grid.rotated(180.degrees, factor: 0.5)
        assertEqual(gridRotated[1, 1, origin: rect.center], rect.center + offset)
        assertEqual(gridRotated[1, 0, origin: rect.center], rect.center.xOffset(rect.halfHeight) + offset)
        assertEqual(gridRotated[0, 1, origin: rect.center], rect.center.yOffset(-rect.halfWidth) + offset)
        
        gridRotated = grid.rotated(180.degrees)
        assertEqual(gridRotated[1, 1, origin: rect.center], rect.center + offset)
        assertEqual(gridRotated[1, 0, origin: rect.center], rect.bottom + offset)
        assertEqual(gridRotated[0, 1, origin: rect.center], rect.trailing + offset)
    }
}

// MARK: ----- ROTATE GRID FROM TO

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsWithRotationFromTo() {
        
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridRotated = grid.rotated(from: 0.degrees, to: 180.degrees, factor: 0)
        assertEqual(gridRotated[0, 0], CGPoint(x, y))
        assertEqual(gridRotated[2, 2], rect.extent)
        assertEqual(gridRotated[2, 0], rect.topTrailing)
        
        gridRotated = grid.rotated(from: 0.degrees, to: 180.degrees, factor: 0.5)
        assertEqual(gridRotated[1, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(gridRotated[0, 1], rect.center.yOffset(-rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
        
        gridRotated = grid.rotated(from: 0.degrees, to: 180.degrees, factor: 1)
        assertEqual(gridRotated[1, 0], rect.bottom)
        assertEqual(gridRotated[0, 1], rect.center.xOffset(rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
    }
    
    @_optimize(none) func testPointsWithRotationFromToWithConfig() {
        
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridRotated = gridConfig
            .rotated(from: 0.degrees, to: 180.degrees, factor: 0)
            .layout(in: rect)
        
        assertEqual(gridRotated[0, 0], CGPoint(x, y))
        assertEqual(gridRotated[2, 2], rect.extent)
        assertEqual(gridRotated[2, 0], rect.topTrailing)
        
        gridRotated = gridConfig
            .rotated(from: 0.degrees, to: 180.degrees, factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridRotated[1, 0], rect.center.xOffset(rect.halfHeight))
        assertEqual(gridRotated[0, 1], rect.center.yOffset(-rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
        
        gridRotated = gridConfig
            .rotated(from: 0.degrees, to: 180.degrees, factor: 1)
            .layout(in: rect)
        
        assertEqual(gridRotated[1, 0], rect.bottom)
        assertEqual(gridRotated[0, 1], rect.center.xOffset(rect.halfWidth))
        assertEqual(gridRotated[1, 1], rect.center)
    }
}

// MARK: ----- SCALE GRID

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsWithScale() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = grid.scaled(.square(2), factor: 0)
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = grid.scaled(.square(2), factor: 0.5)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = grid.scaled(.square(2))
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    @_optimize(none) func testPointsWithScaleWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = gridConfig
            .scaled(.square(2), factor: 0)
            .layout(in: rect)
        
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = gridConfig
            .scaled(.square(2), factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = gridConfig
            .scaled(.square(2))
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    @_optimize(none) func testPointsWithScaleForRelativeReframed() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .topLeading)
        
        var gridScaled = grid.scaled(.square(2), factor: 0)
        assertEqual(gridScaled[0, 0], bottomRightRect.origin)
        assertEqual(gridScaled[2, 2], bottomRightRect.extent)
        assertEqual(gridScaled[2, 0], bottomRightRect.topTrailing)
        
        gridScaled = grid.scaled(.square(2), factor: 0.5)
        assertEqual(gridScaled[1, 0], bottomRightRect.top.yOffset(bottomRightRect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], bottomRightRect.leading.xOffset(bottomRightRect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], bottomRightRect.center)
        
        gridScaled = grid.scaled(.square(2))
        assertEqual(gridScaled[1, 0], bottomRightRect.top.yOffset(-bottomRightRect.halfHeight))
        assertEqual(gridScaled[0, 1], bottomRightRect.leading.xOffset(-bottomRightRect.halfWidth))
        assertEqual(gridScaled[1, 1], bottomRightRect.center)
    }
    
    @_optimize(none) func testPointsWithScaleForRelativeWithOrigin() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.reframed(bottomRightRect, origin: .center)
        let offset = CGPoint(-rect.halfWidth, 0)
        
        var gridScaled = grid.scaled(.square(2), factor: 0)
        assertEqual(gridScaled[0, 0, origin: rect.leading], bottomRightRect.origin + offset)
        assertEqual(gridScaled[2, 2, origin: rect.leading], bottomRightRect.extent + offset)
        assertEqual(gridScaled[2, 0, origin: rect.leading], bottomRightRect.topTrailing + offset)
        
        gridScaled = grid.scaled(.square(2), factor: 0.5)
        assertEqual(gridScaled[1, 0, origin: rect.leading], bottomRightRect.top.yOffset(bottomRightRect.heightScaled(-0.25)) + offset)
        assertEqual(gridScaled[0, 1, origin: rect.leading], bottomRightRect.leading.xOffset(bottomRightRect.widthScaled(-0.25)) + offset)
        assertEqual(gridScaled[1, 1, origin: rect.leading], bottomRightRect.center + offset)
        
        gridScaled = grid.scaled(.square(2))
        assertEqual(gridScaled[1, 0, origin: rect.leading], bottomRightRect.top.yOffset(-bottomRightRect.halfHeight) + offset)
        assertEqual(gridScaled[0, 1, origin: rect.leading], bottomRightRect.leading.xOffset(-bottomRightRect.halfWidth) + offset)
        assertEqual(gridScaled[1, 1, origin: rect.leading], bottomRightRect.center + offset)
    }
}

// MARK: ----- SCALE GRID FROM TO

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPointsWithScaleFromTo() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = grid.scaled(from: .square(1), to: .square(2), factor: 0)
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = grid.scaled(from: .square(1), to: .square(2), factor: 0.5)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = grid.scaled(from: .square(1), to: .square(2), factor: 1)
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
    
    @_optimize(none) func testPointsWithScaleFromToWithConfig() {
        let gridConfig = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        var gridScaled = gridConfig
            .scaled(from: .square(1), to: .square(2), factor: 0)
            .layout(in: rect)
        
        assertEqual(gridScaled[0, 0], CGPoint(x, y))
        assertEqual(gridScaled[2, 2], rect.extent)
        assertEqual(gridScaled[2, 0], rect.topTrailing)
        
        gridScaled = gridConfig
            .scaled(from: .square(1), to: .square(2), factor: 0.5)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(rect.heightScaled(-0.25)))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(rect.widthScaled(-0.25)))
        assertEqual(gridScaled[1, 1], rect.center)
        
        gridScaled = gridConfig
            .scaled(from: .square(1), to: .square(2), factor: 1)
            .layout(in: rect)
        
        assertEqual(gridScaled[1, 0], rect.top.yOffset(-rect.halfHeight))
        assertEqual(gridScaled[0, 1], rect.leading.xOffset(-rect.halfWidth))
        assertEqual(gridScaled[1, 1], rect.center)
    }
}

// MARK: ----- CONSTRUCTED FROM LAYOUT CONFIG WITH SCALE AND OFFSET

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPropertiesForRotatedAndOffsetGridLayoutFromConfig() {
        let offset = CGPoint(15, 20)
        
        var grid = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1])
            .rotated(180.degrees)
            .offset(offset)
            .layout(in: rect)
        
        assertEqual(grid.topLeading, rect.bottomTrailing.offset(offset))
        assertEqual(grid[0, 0], rect.bottomTrailing.offset(offset))
        assertEqual(grid.top, rect.bottom.offset(offset))
        assertEqual(grid[1, 0], grid.top)
        assertEqual(grid.topTrailing, rect.bottomLeading.offset(offset))
        assertEqual(grid[2, 0], grid.topTrailing)
        assertEqual(grid.trailing, rect.leading.offset(offset))
        assertEqual(grid[2, 1], grid.trailing)
        assertEqual(grid.bottomTrailing, rect.topLeading.offset(offset))
        assertEqual(grid[2, 2], grid.bottomTrailing)
        assertEqual(grid.bottom, rect.top.offset(offset))
        assertEqual(grid[1, 2], grid.bottom)
        assertEqual(grid.bottomLeading, rect.topTrailing.offset(offset))
        assertEqual(grid[0, 2], grid.bottomLeading)
        assertEqual(grid.leading, rect.trailing.offset(offset))
        assertEqual(grid[0, 1], grid.leading)
        assertEqual(grid.center, rect.center.offset(offset))
        assertEqual(grid[1, 1], grid.center)
    }
}

// MARK: ----- CONSTRUCT WITH GRID CONFIG OVERLOADS

extension GridLayoutGuideTests {

    @_optimize(none) func testLayoutGuideConfigGridOverloads() {
        
        var grid = LayoutGuideConfig.grid(columns: 2, rows: 2).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: 2).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuideConfig.grid(columns: 2, rows: [0, 0.5, 1]).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuideConfig.grid(columns: [0, 0.5, 1], rows: [0, 0.5, 1]).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
    }
}

// MARK: ----- CONSTRUCTED WITH ALTERNATIVE ORIGIN

extension GridLayoutGuideTests {
    
    @_optimize(none) func testLayoutGuideAlternativeOrigin() {
        
        var grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .topLeading)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .top)
        assertEqual(grid[0, 0], rect.top)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .topTrailing)
        assertEqual(grid[0, 0], rect.topTrailing)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .trailing)
        assertEqual(grid[0, 0], rect.trailing)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .bottomTrailing)
        assertEqual(grid[0, 0], rect.bottomTrailing)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .bottom)
        assertEqual(grid[0, 0], rect.bottom)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .bottomLeading)
        assertEqual(grid[0, 0], rect.bottomLeading)
        grid = LayoutGuide.grid(rect, columns: 2, rows: 2, origin: .leading)
        assertEqual(grid[0, 0], rect.leading)
    }
    
    @_optimize(none) func testLayoutGuideAlternativeOriginWithConfig() {
        
        var grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .topLeading).layout(in: rect)
        assertEqual(grid[0, 0], rect.topLeading)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .top).layout(in: rect)
        assertEqual(grid[0, 0], rect.top)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .topTrailing).layout(in: rect)
        assertEqual(grid[0, 0], rect.topTrailing)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .trailing).layout(in: rect)
        assertEqual(grid[0, 0], rect.trailing)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .bottomTrailing).layout(in: rect)
        assertEqual(grid[0, 0], rect.bottomTrailing)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .bottom).layout(in: rect)
        assertEqual(grid[0, 0], rect.bottom)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .bottomLeading).layout(in: rect)
        assertEqual(grid[0, 0], rect.bottomLeading)
        grid = LayoutGuideConfig.grid(columns: 2, rows: 2, origin: .leading).layout(in: rect)
        assertEqual(grid[0, 0], rect.leading)
    }
}

// MARK: ----- DIMENSION PROPERTIES

extension GridLayoutGuideTests {
    
    @_optimize(none) func testPropertiesForGridLayout() {
        let grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        
        assertEqual(grid.topLeading, rect.topLeading)
        assertEqual(grid.top, rect.top)
        assertEqual(grid.topTrailing, rect.topTrailing)
        assertEqual(grid.trailing, rect.trailing)
        assertEqual(grid.bottomTrailing, rect.bottomTrailing)
        assertEqual(grid.bottom, rect.bottom)
        assertEqual(grid.bottomLeading, rect.bottomLeading)
        assertEqual(grid.leading, rect.leading)
        assertEqual(grid.center, rect.center)

    }
    
    @_optimize(none) func testPropertiesForScaledGridLayout() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.scaled(2)
        
        assertEqual(grid.topLeading, rect.topLeading.offset(rect.sizeScaled(-0.5)))
        assertEqual(grid.top, rect.top.yOffset(-rect.halfHeight))
        assertEqual(grid.topTrailing, rect.topTrailing.offset(rect.sizeScaled(.point(0.5, -0.5))))
        assertEqual(grid.trailing, rect.trailing.xOffset(rect.halfWidth))
        assertEqual(grid.bottomTrailing, rect.bottomTrailing.offset(rect.sizeScaled(0.5)))
        assertEqual(grid.bottom, rect.bottom.yOffset(rect.halfHeight))
        assertEqual(grid.bottomLeading, rect.bottomLeading.offset(rect.sizeScaled(.point(-0.5, 0.5))))
        assertEqual(grid.leading, rect.leading.xOffset(-rect.halfWidth))
    }
    
    @_optimize(none) func testPropertiesForOffsetGridLayout() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offset = CGPoint(15, 20)
        grid = grid.offset(offset)
        
        assertEqual(grid.topLeading, rect.topLeading.offset(offset))
        assertEqual(grid.top, rect.top.offset(offset))
        assertEqual(grid.topTrailing, rect.topTrailing.offset(offset))
        assertEqual(grid.trailing, rect.trailing.offset(offset))
        assertEqual(grid.bottomTrailing, rect.bottomTrailing.offset(offset))
        assertEqual(grid.bottom, rect.bottom.offset(offset))
        assertEqual(grid.bottomLeading, rect.bottomLeading.offset(offset))
        assertEqual(grid.leading, rect.leading.offset(offset))
    }
    
    @_optimize(none) func testPropertiesForRotatedGridLayout() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        grid = grid.rotated(180.degrees)
        
        assertEqual(grid.topLeading, rect.bottomTrailing)
        assertEqual(grid.top, rect.bottom)
        assertEqual(grid.topTrailing, rect.bottomLeading)
        assertEqual(grid.trailing, rect.leading)
        assertEqual(grid.bottomTrailing, rect.topLeading)
        assertEqual(grid.bottom, rect.top)
        assertEqual(grid.bottomLeading, rect.topTrailing)
        assertEqual(grid.leading, rect.trailing)
    }
    
    @_optimize(none) func testPropertiesForRotatedAndOffsetGridLayout() {
        var grid = LayoutGuide.grid(rect, columns: [0, 0.5, 1], rows: [0, 0.5, 1])
        let offset = CGPoint(15, 20)
        grid = grid.rotated(180.degrees)
        grid = grid.offset(offset)
        
        assertEqual(grid.topLeading, rect.bottomTrailing.offset(offset))
        assertEqual(grid[0, 0], grid.topLeading)
        assertEqual(grid.top, rect.bottom.offset(offset))
        assertEqual(grid[1, 0], grid.top)
        assertEqual(grid.topTrailing, rect.bottomLeading.offset(offset))
        assertEqual(grid[2, 0], grid.topTrailing)
        assertEqual(grid.trailing, rect.leading.offset(offset))
        assertEqual(grid[2, 1], grid.trailing)
        assertEqual(grid.bottomTrailing, rect.topLeading.offset(offset))
        assertEqual(grid[2, 2], grid.bottomTrailing)
        assertEqual(grid.bottom, rect.top.offset(offset))
        assertEqual(grid[1, 2], grid.bottom)
        assertEqual(grid.bottomLeading, rect.topTrailing.offset(offset))
        assertEqual(grid[0, 2], grid.bottomLeading)
        assertEqual(grid.leading, rect.trailing.offset(offset))
        assertEqual(grid[0, 1], grid.leading)
        assertEqual(grid.center, rect.center.offset(offset))
        assertEqual(grid[1, 1], grid.center)
    }
}

// MARK: ----- ANCHOR LOCATION

extension GridLayoutGuideTests {
    
    @_optimize(none) func testAnchorLocation() {
        let grid = LayoutGuide.grid(rect, columns: 10, rows: 10)
        
        assertEqual(grid.anchorLocation(for: .topLeading), rect.topLeading)
        assertEqual(grid.anchorLocation(for: .top), rect.top)
        assertEqual(grid.anchorLocation(for: .topTrailing), rect.topTrailing)
        assertEqual(grid.anchorLocation(for: .trailing), rect.trailing)
        assertEqual(grid.anchorLocation(for: .bottomTrailing), rect.bottomTrailing)
        assertEqual(grid.anchorLocation(for: .bottom), rect.bottom)
        assertEqual(grid.anchorLocation(for: .bottomLeading), rect.bottomLeading)
        assertEqual(grid.anchorLocation(for: .leading), rect.leading)
        assertEqual(grid.anchorLocation(for: .center), rect.center)
        
        assertEqual(grid.anchorLocation(for: UnitPoint(0.25, 0.5)), CGPoint(rect.xScaled(0.25), rect.yScaled(0.5)))
        assertEqual(grid.anchorLocation(for: UnitPoint(0.75, 0.75)), CGPoint(rect.xScaled(0.75), rect.yScaled(0.75)))

    }
}
