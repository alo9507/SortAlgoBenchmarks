//
//  AdjacencyList.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/17/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// An AdjacencyList can be represented by a Dictionary of Arrays
// Storage O(V + E)
// AddVertex O(1)
// AddEdge: O(1)
// Finding Edges and Weights: O(V)

/// Vertex-indexed array of edges
struct AdjacencyList<Element: Hashable>: Graph {
    typealias Edge = GraphEdge<Element>
    typealias Vertex = Edge.Vertex
    
    /// Vertex-keyed dictionary of edge-lists representing a vertex's neighbors
    public var adjacencies: [Vertex: [Edge]] = [:]
    
    /// An index-to-vertex dicitonary for quick lookup of a pre-existing vertex
    public var vertexWithIndex: [Int:Vertex] = [:]
    
    init() {}
    
    init(vertices: [Vertex]) {
        for vertex in vertices {
            adjacencies[vertex] = []
        }
    }
    
    var vertices: [Vertex] {
        return Array(adjacencies.keys)
    }
    
    var edges: [Edge] {
        let uniqueEdges = Set(adjacencies.values.flatMap({ $0 }))
        return Array(uniqueEdges)
    }
    
    var sortedEdges: [Edge] {
        return Array(adjacencies.values.flatMap({ $0 })).sorted(by: { $0.weight < $1.weight })
    }
    
    @discardableResult
    mutating func addVertex(element: Element) -> Vertex {
        let vertex = Vertex(index: adjacencies.count, element: element)
        adjacencies[vertex] = []
        vertexWithIndex[vertex.index] = vertex
        return vertex
    }
    
    @discardableResult
    mutating func addVertex(vertex: Vertex) -> Vertex {
        adjacencies[vertex] = []
        vertexWithIndex[vertex.index] = vertex
        return vertex
    }
    
    mutating func addEdge(_ edge: Edge, directed: Bool = false) {
        adjacencies[edge.source]!.append(edge)
        if !directed {
            let reversedEdge = Edge(source: edge.destination, destination: edge.source, weight: edge.weight)
            adjacencies[edge.destination]!.append(reversedEdge)
        }
    }
    
    mutating func addEdge(source: Vertex, destination: Vertex, _ directed: Bool = false, weight: Double = 0.0) {
        let edge = Edge(source: source, destination: destination)
        
        adjacencies[source]!.append(edge)
        if !directed {
            let reversedEdge = Edge(source: destination, destination: source, weight: edge.weight)
            adjacencies[destination]!.append(reversedEdge)
        }
    }
    
    func getEdges(from source: Vertex) -> [Edge] {
        return adjacencies[source] ?? []
    }
}

extension AdjacencyList: CustomStringConvertible {
  var description: String {
    return
      adjacencies.mapValues { edges in
        edges
          .sorted { $0.destination.index < $1.destination.index }
          .map { "\($0.destination.element) (\($0.weight))" }
      }
      .sorted { $0.key.index < $1.key.index }
      .map {
        let source = "\($0.key.index): \($0.key.element)"

        guard !$0.value.isEmpty else {
          return source
        }

        let sourceWithArrow = "\(source) -> "
        return """
          \(sourceWithArrow)\($0.value.joined(separator: "\n"
            + String(repeating: " ", count: sourceWithArrow.count)
          ))
          """
      }
      .joined(separator: "\n\n")
  }
}

// MARK:- 2d Grid Initializer

extension AdjacencyList {
    init(grid: [[Element]]) {
        for row in stride(from: 0, to: grid.count, by: 1) {
            for col in stride(from: 0, to: grid[row].count, by: 1) {
                addNeighborsAsEdges(position: (row: row, col: col), grid)
            }
        }
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
        let vertexIndex = indexForPosition((row: position.row, col: position.col), in: grid)
        var vertex: Vertex
        if !containsVertexWithIndex(vertexIndex) {
            vertex = addVertex(element: grid[position.row][position.col])
        } else {
            vertex = getVertexWithIndex(vertexIndex)!
        }
        return vertex
    }
    
    func indexForPosition(_ position: (row: Int, col: Int), in grid: [[Element]]) -> Int {
        let width = grid[0].count
        return width * position.row + position.col
    }
    
    func containsVertexWithIndex(_ index: Int) -> Bool {
        return vertexWithIndex[index] != nil
    }
    
    func getVertexWithIndex(_ index: Int) -> Vertex? {
        return vertexWithIndex[index]
    }
    
    func getEdges(from position: (row: Int, col: Int), in grid: [[Element]]) -> [Edge] {
        guard let source = getVertexWithIndex(indexForPosition(position, in: grid)) else {
            return []
        }
        return adjacencies[source] ?? []
    }
}
