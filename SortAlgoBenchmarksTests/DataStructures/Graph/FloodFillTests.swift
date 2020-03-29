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
            [1,2,3,4],
            [5,6,7,8],
            [9, 10,11,12],
            [13,14,15,16]
        ]
        
        let position = (row: 0, col: 0)
        let color = 5
        let target = grid[position.row][position.col]
        FloodFill.fill(from: position, target: target, replacement: color, grid: &grid)
        
//        XCTAssertEqual(grid[position.row][position.col], color)
    }
}
