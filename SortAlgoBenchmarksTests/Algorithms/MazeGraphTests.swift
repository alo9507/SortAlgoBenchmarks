//
//  MazeGraphTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 4/10/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

class MazeGraphTests: XCTestCase {
    func testBinarySearch() {
        var grid_pathExists = [
            [0,1,0,1,1,1,0,1],
            [1,1,0,1,1,0,1,1],
            [1,0,0,1,0,0,1,0],
            [1,0,0,1,1,0,1,0],
            [1,0,0,0,1,0,1,0],
            [1,1,0,0,1,0,1,1],
            [0,1,1,1,1,1,0,1],
            [1,1,0,0,0,1,1,1],
        ]
        
        var grid_noPath = [
            [0,1,0,1,1,1,0,1],
            [1,1,0,1,1,0,1,1],
            [1,0,0,1,0,0,1,0],
            [1,0,0,1,1,0,1,0],
            [1,0,0,0,1,0,1,0],
            [1,1,0,0,1,0,1,1],
            [0,1,1,0,1,1,0,1],
            [1,1,0,0,0,1,1,1],
        ]
        
        XCTAssertTrue(MazeGraph.pathExists(grid_pathExists, start: (7,0), finish: (0,7)))
        
        XCTAssertFalse(MazeGraph.pathExists(grid_noPath, start: (7,0), finish: (0,7)))
    }
}

