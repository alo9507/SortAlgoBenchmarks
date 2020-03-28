//
//  FloodFill.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/28/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// A 4 direction flood fill (8 direction includes diagonals)
enum FloodFill {
    static func fill(from position: (row: Int, col: Int), target: Int, replacement: Int, grid: inout [[Int]]) {
        let graph = AdjacencyList(grid: grid)
        
        // pass the flood augmentation to the DFS
            // only update neighbors with the same color as current
    }
}
