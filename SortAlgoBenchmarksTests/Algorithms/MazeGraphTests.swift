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
    func testMazeGraph() {
        let grid_pathExists = [
            [0,1,0,1,1,1,0,1],
            [1,1,0,1,1,0,1,1],
            [1,0,0,1,0,0,1,0],
            [1,0,0,1,1,0,1,0],
            [1,0,0,0,1,0,1,0],
            [1,1,0,0,1,0,1,1],
            [0,1,1,1,1,1,0,1],
            [1,1,0,0,0,1,1,1],
        ]
        
        let grid_noPath = [
            [0,1,0,1,1,1,0,1],
            [1,1,0,1,1,0,1,1],
            [1,0,0,1,0,0,1,0],
            [1,0,0,1,1,0,1,0],
            [1,0,0,0,1,0,1,0],
            [1,1,0,0,1,0,1,1],
            [0,1,1,0,1,1,0,1],
            [1,1,0,0,0,1,1,1],
        ]
        
        // Iterative DFS w/ Stack
        XCTAssertTrue(MazeGraph.pathExists_iterativeDfs(grid_pathExists, start: (7,0), finish: (0,7)))
        XCTAssertFalse(MazeGraph.pathExists_iterativeDfs(grid_noPath, start: (7,0), finish: (0,7)))
        
        // Recursive DFS
        XCTAssertTrue(MazeGraph.pathExists_dfsRecursive(grid_pathExists, start: (7,0), finish: (0,7)))
        XCTAssertFalse(MazeGraph.pathExists_dfsRecursive(grid_noPath, start: (7,0), finish: (0,7)))
        
        // Iterative BFS w/ Queue
        XCTAssertTrue(MazeGraph.pathExists_iterativeBfs(grid_pathExists, start: (7,0), finish: (0,7)))
        XCTAssertFalse(MazeGraph.pathExists_iterativeBfs(grid_noPath, start: (7,0), finish: (0,7)))
        
        print(MazeGraph.pathToEnd_dfsRecursive(grid_pathExists, start: (7,0), finish: (0,7)))
    }
}

