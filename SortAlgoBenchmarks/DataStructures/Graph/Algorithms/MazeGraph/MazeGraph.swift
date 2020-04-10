//
//  MazeGraph.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/24/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

enum MazeGraph {
    static func pathExists_iterativeDfs(_ grid: [[Int]],
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
            guard !visited[row][col] else { continue }
            guard grid[row][col] == 1 else { continue }
            
            visited[row][col] = true
            
            stack.push((row: row, col: col - 1))
            stack.push((row: row, col: col + 1))
            stack.push((row: row - 1, col: col))
            stack.push((row: row + 1, col: col))
        }
        
        return false
    }
    
    static func pathExists_dfsRecursive(_ grid: [[Int]], start: (row: Int, col: Int), finish: (row: Int, col: Int)) -> Bool {
        var height = grid.count
        var width = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        
        var pathExists = false
        func recurseDfs(from position: (row: Int, col: Int)) {
            if position == finish { pathExists = true; return }
            
            let row = position.row
            let col = position.col
            
            if row < 0 || col < 0 || row >= height || col >= width { return }
            guard !visited[row][col] else { return }
            guard grid[row][col] == 1 else { return }
            
            visited[row][col] = true
            
            recurseDfs(from: (row: row, col: col - 1))
            recurseDfs(from: (row: row, col: col + 1))
            recurseDfs(from: (row: row - 1, col: col))
            recurseDfs(from: (row: row + 1, col: col))
        }
        
        recurseDfs(from: start)
        return pathExists
    }
    
    static func pathExists_iterativeBfs(_ grid: [[Int]], start: (row: Int, col: Int), finish: (row: Int, col: Int)) -> Bool {
        let height = grid.count
        let width = grid[0].count
        
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        var queue = ArrayQueue<(row: Int, col: Int)>()
        
        queue.enqueue(start)
        
        while let position = queue.dequeue() {
            if position == finish { return true }
            
            let row = position.row
            let col = position.col
            
            if row < 0 || col < 0 || row >= height || col >= width { continue }
            guard !visited[row][col] else { continue }
            guard grid[row][col] == 1 else { continue }
            
            visited[row][col] = true
            
            queue.enqueue((row, col + 1))
            queue.enqueue((row, col - 1))
            queue.enqueue((row + 1, col))
            queue.enqueue((row - 1, col))
        }
        
        return false
    }
}

extension MazeGraph {
    static func pathToEnd_dfsRecursive(_ grid: [[Int]], start: (row: Int, col: Int), finish: (row: Int, col: Int)) -> [(row: Int, col: Int)] {
        var height = grid.count
        var width = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: width), count: height)
        var path: [(row: Int, col: Int)] = []
        
        func recurseDfs(from position: (row: Int, col: Int)) -> [(row: Int, col: Int)] {
            let row = position.row
            let col = position.col
            
            if row < 0 || col < 0 || row >= height || col >= width { return [] }
            guard !visited[row][col] else { return [] }
            guard grid[row][col] == 1 else { return  [] }
            
            visited[row][col] = true
            
            path = recurseDfs(from: (row: row, col: col - 1)) + path
            path = recurseDfs(from: (row: row, col: col + 1)) + path
            path = recurseDfs(from: (row: row - 1, col: col)) + path
            path = recurseDfs(from: (row: row + 1, col: col)) + path
            
            return path
        }
        
        return recurseDfs(from: start)
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

