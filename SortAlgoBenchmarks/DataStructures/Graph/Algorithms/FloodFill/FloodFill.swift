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
        
        let dr = [-1,1,0,0]
        let dc = [0,0,1,-1]
        
//        for i in stride(from: 0, to: 4, by: 1) {
//            let rr = r + dr[i]
//            let cc = c + cr[i]
//
//            // Skip invalid cells
//            if rr < 0 || cc < 0 { continue }
//            if rr >= R || cc >= C { continue }
//        }
        
        // pass the flood augmentation to the DFS
            // only update neighbors with the same color as current
    }
}

/*
 Iterative DFS throug a 2d matrix
 
 Define direction vectors
 */
