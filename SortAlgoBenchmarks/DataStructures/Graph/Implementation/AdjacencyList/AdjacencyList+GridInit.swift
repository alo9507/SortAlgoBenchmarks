//
//  AdjacencyList+GridInit.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/29/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

extension AdjacencyList {
    init(grid: [[Element]]) {
        for row in stride(from: 0, to: grid.count, by: 1) {
            for col in stride(from: 0, to: grid[row].count, by: 1) {
                addNeighborsAsEdges(position: (row: row, col: col), grid)
            }
        }
    }
    
    @discardableResult
    mutating func addVertex(element: Element, at position: (row: Int, col: Int)) -> Vertex {
        let vertex = Vertex(index: indexForPosition(position), element: element)
        adjacencies[vertex] = []
        vertexWithIndex[vertex.index] = vertex
        return vertex
    }
    
    mutating func addNeighborsAsEdges(position: (row: Int, col: Int), _ grid: [[Element]]) {
        let height = grid.count
        let width = grid[0].count
        let row = position.row
        let col = position.col
        
        let dr = [-1,1,0,0]
        let dc = [0,0,1,-1]
        
        let source = addOrRetreiveVertex(at: (row: row, col: col), in: grid)
        
        for i in stride(from: 0, to: 4, by: 1) {
            let rr = position.row + dr[i]
            let cc = position.col + dc[i]
            
            if rr < 0 || cc < 0 { continue }
            if rr >= height || cc >= width { continue }
            
            let destination = addOrRetreiveVertex(at: (row: rr, col: cc), in: grid)
            
            let edge = Edge(source: source, destination: destination)
            addEdge(edge, directed: true)
        }
    }
    
    mutating func addOrRetreiveVertex(at position: (row: Int, col: Int), in grid: [[Element]]) -> Vertex {
        var vertex: Vertex
        if !containsVertexWithIndex(indexForPosition(position)) {
            vertex = addVertex(element: grid[position.row][position.col], at: position)
        } else {
            vertex = getVertexWithIndex(indexForPosition(position))!
        }
        return vertex
    }
    
    func indexForPosition(_ position: (row: Int, col: Int)) -> String {
        return String(position.row) + String(position.col)
    }
    
    func containsVertexWithIndex(_ index: String) -> Bool {
        return vertexWithIndex[index] != nil
    }
    
    func getVertexWithIndex(_ index: String) -> Vertex? {
        return vertexWithIndex[index]
    }
    
    func getEdges(from position: (row: Int, col: Int), in grid: [[Element]]) -> [Edge] {
        guard let source = getVertexWithIndex(indexForPosition(position)) else {
            return []
        }
        return adjacencies[source] ?? []
    }
}

