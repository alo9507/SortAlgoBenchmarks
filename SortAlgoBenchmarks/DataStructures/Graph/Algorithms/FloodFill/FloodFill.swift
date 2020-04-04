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
    static func fill(from position: (row: Int, col: Int),
                     targetColor: Int,
                     replacementColor: Int,
                     grid: inout [[Int]]) {
        
        let height = grid.count
        let width = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        var queue = ArrayQueue<(row: Int, col: Int)>()
        
        queue.enqueue(position)
        
        while let cell = queue.dequeue() {
            let row = cell.row
            let col = cell.col
            
            if row < 0 || col < 0 || row >= height || col >= width { continue }
            guard !visited[row][col] else { continue }
            guard grid[row][col] == targetColor else { continue }
            
            visited[row][col] = true
            grid[row][col] = replacementColor
            
            queue.enqueue((row, col-1))
            queue.enqueue((row, col+1))
            queue.enqueue((row - 1, col))
            queue.enqueue((row + 1, col))
        }
    }
}

/*
 Iterative DFS throug a 2d matrix
 
 Define direction vectors
 */
