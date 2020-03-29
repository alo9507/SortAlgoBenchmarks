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
    public var vertexWithIndex: [String:Vertex] = [:]
    
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
        return Array(adjacencies.values.flatMap({ $0 }))
    }
    
    var sortedEdges: [Edge] {
        return Array(adjacencies.values.flatMap({ $0 })).sorted(by: { $0.weight < $1.weight })
    }
    
    @discardableResult
    mutating func addVertex(element: Element) -> Vertex {
        let vertex = Vertex(index: String(adjacencies.count), element: element)
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
