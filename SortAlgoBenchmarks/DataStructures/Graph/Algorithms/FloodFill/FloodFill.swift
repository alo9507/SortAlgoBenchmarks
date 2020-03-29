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
        let height = grid.count
        let width = grid[0].count
        
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        
        var queue = ArrayQueue<(row: Int, col: Int)>()
        
        queue.enqueue((0,0))
        
        while let position = queue.dequeue() {
            let row = position.row
            let col = position.col
            
            if row < 0 || col < 0 || row >= height || col >= width { continue }
            guard visited[row][col] == false else { continue }
            
            visited[row][col] = true
            print(grid[row][col])
            
            queue.enqueue((row, col - 1))
            queue.enqueue((row, col + 1))
            queue.enqueue((row - 1, col))
            queue.enqueue((row + 1, col))
        }
        
//        let dr = [-1,1,0,0]
//        let dc = [0,0,1,-1]
//
//        for row in stride(from: 0, to: grid.count, by: 1) {
//            for col in stride(from: 0, to: grid[row].count, by: 1) {
//                for i in stride(from: 0, to: 4, by: 1) {
//                    let rr = row + dr[i]
//                    let cc = col + dc[i]
//
//                    if rr < 0 || cc < 0 { continue }
//                    if rr >= width || cc >= height { continue }
//                }
//            }
//        }
        
        // pass the flood augmentation to the DFS
            // only update neighbors with the same color as current
    }
}

/*
 Iterative DFS throug a 2d matrix
 
 Define direction vectors
 */
