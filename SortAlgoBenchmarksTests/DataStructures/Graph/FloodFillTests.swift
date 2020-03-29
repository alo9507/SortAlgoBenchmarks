//
//  FloodFillTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/28/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

final class FloodFillTest: XCTestCase {
    func test_floodFill() {
        var grid: [[Int]] = [
            [1,1,1,1],
            [1,1,7,8],
            [9, 1,11,12],
            [13,14,1,16]
        ]
        
        let position = (row: 0, col: 0)
        let targetColor = grid[position.row][position.col]
        let replacementColor = 5
        
        FloodFill.fill(from: position, targetColor: targetColor, replacementColor: replacementColor, grid: &grid)
        print(grid.description)
        XCTAssertEqual(grid[0][0], replacementColor)
        XCTAssertEqual(grid[2][1], replacementColor)
        XCTAssertEqual(grid[3][2], targetColor)
    }
}
