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
    
    init(grid: [[Element]]) {
        for row in stride(from: 0, to: grid.count, by: 1) {
            for col in stride(from: 0, to: grid[row].count, by: 1) {
                addNeighborsAsEdges(position: (row: row, col: col), grid)
            }
        }
    }
    
    mutating func addNeighborsAsEdges(position: (row: Int, col: Int), _ grid: [[Element]]) {
        let dr = [-1,1,0,0]
        let dc = [0,0,1,-1]
        
        let element = grid[position.row][position.col]
        let source = addVertex(element: element)
        
        for i in stride(from: 0, to: 4, by: 1) {
            let rr = position.row + dr[i]
            let cc = position.col + dc[i]
            
            if rr < 0 || cc < 0 { continue }
            if rr >= grid.count || cc >= grid[0].count { continue }
            
            let index = getIndexForPosition((row: rr, col: cc), in: grid)
            
            var destination: Vertex
            if !containsVertexWithIndex(index) {
                destination = addVertex(element: grid[rr][cc])
            } else {
                destination = getVertexWithIndex(index)!
            }
            
            let edge = Edge(source: source, destination: destination)
            addEdge(edge)
        }
    }
    
    init() {}
    
    init(vertices: [Vertex]) {
        for vertex in vertices {
            adjacencies[vertex] = []
        }
    }
    
    func getIndexForPosition(_ position: (row: Int, col: Int), in grid: [[Element]]) -> Int {
        let width = grid.count
        return width * position.col + position.row
    }
    
    func containsVertexWithIndex(_ index: Int) -> Bool {
        return vertices.filter { (vertex) in
            return vertex.index == index
        }.first != nil
    }
    
    func getVertexWithIndex(_ index: Int) -> Vertex? {
        return vertices.filter { (vertex) in
            return vertex.index == index
        }.first
    }
    
    // the graphs vertices are the keys of the adjacency dictionary
    var vertices: [Vertex] {
        return Array(adjacencies.keys)
    }
    
    var sortedEdges: [Edge] {
        return Array(adjacencies.values.flatMap({ $0 })).sorted(by: { $0.weight < $1.weight })
    }
    
    @discardableResult
    mutating func addVertex(element: Element) -> Vertex {
        let vertex = Vertex(index: adjacencies.count, element: element)
        adjacencies[vertex] = []
        return vertex
    }
    
    @discardableResult
    mutating func addVertex(vertex: Vertex) -> Vertex {
        adjacencies[vertex] = []
        return vertex
    }
    
    // An undirected graph could be seen as a bidirectional graph, where every edge could be traversed in both directions
    // Should allow parallel edges? Or should there be a check for that?
    mutating func addEdge(_ edge: Edge, _ directed: Bool = false) {
        if !adjacencies.keys.contains(edge.source) {
            addVertex(vertex: edge.source)
        }
        
        if !adjacencies.keys.contains(edge.destination) {
            addVertex(vertex: edge.destination)
        }
        
        adjacencies[edge.source]!.append(edge)
        if !directed {
            let reversedEdge = Edge(source: edge.destination, destination: edge.source, weight: edge.weight)
            
            // only add this exact undirected edge if its not already present
            if !adjacencies[edge.destination]!.contains(reversedEdge) {
                adjacencies[edge.destination]!.append(reversedEdge)
            }
            
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
