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
    
    public var adjacencies: [Vertex: [Edge]] = [:]
    
    init(grid: [[Element]]) {
        for row in stride(from: 0, to: grid.count, by: 1) {
            for col in stride(from: 0, to: grid[row].count, by: 1) {
                let element = grid[row][col]
                let source = addVertex(element: element)
                adjacencies[source] = []
//                addNeighborsAsEdges()
            }
        }
        
        for row in stride(from: 0, to: grid.count, by: 1) {
            for col in stride(from: 0, to: grid[row].count, by: 1) {
                // need the index and the element...
                
                // add top neighbor
                if row - 1 > 0 {
                    let sourceIndex = getIndexForPosition((row, col), in: grid)
                    let topNeighborIndex = getIndexForPosition((row - 1, col), in: grid)
                    guard let source = getVertexWithIndex(sourceIndex) else {
                        fatalError("No source")
                    }
                    guard let destination = getVertexWithIndex(topNeighborIndex) else {
                        fatalError("No dest")
                    }
                    let edge = Edge(source: source, destination: destination)
                    addEdge(edge)
                }
            }
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
            adjacencies[edge.destination]!.append(reversedEdge)
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

