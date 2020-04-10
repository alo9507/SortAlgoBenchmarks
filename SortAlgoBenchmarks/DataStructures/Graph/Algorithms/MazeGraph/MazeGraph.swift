//
//  MazeGraph.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/24/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

enum MazeGraph {
    static func pathExists(_ grid: [[Int]],
                           start: (row: Int, col: Int),
                           finish: (row: Int, col: Int)) -> Bool {
        var path = Array<Int>()
        var stack = ArrayStack<(row: Int, col: Int)>()
        
        let height = grid.count
        let width = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        
        stack.push(start)
        
        while let position = stack.pop() {
            if position == finish { return true }
            let row = position.row
            let col = position.col
            
            if row < 0 || col < 0 || row >= height || col >= width { continue }
            guard visited[row][col] == false else { continue }
            guard grid[row][col] == 1 else { continue }
            
            visited[row][col] = true
            print(position)
            
            stack.push((row: row, col: col - 1))
            stack.push((row: row, col: col + 1))
            stack.push((row: row - 1, col: col))
            stack.push((row: row + 1, col: col))
        }
        
        return false
    }
}

/*
 Vertex = intersection
 Edge = passage
 Goal: Explore every intersection in the maze
 (Hint: DFS)
 
 Try it on the PacMan maze
 
 Tremaux maze exploration
 
 // Correctness proof. Performance proof.
 
 Questions:
 What does it mean to "back up" in a recursive algorithm?
 - Every recursive call corresponds to an edge on a graph
 - To go up one in the stacktrace, AKA just don't make a recursive call
 How does it no go to the same place twice?
 */

