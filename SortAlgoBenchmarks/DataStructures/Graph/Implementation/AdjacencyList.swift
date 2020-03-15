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

struct AdjacencyList<Element: Hashable>: Graph {
    typealias Edge = GraphEdge<Element>
    typealias Vertex = Edge.Vertex
    
    public var adjacencies: [Vertex: [Edge]] = [:]
    
    init() {}
    
    init(vertices: [Vertex]) {
        for vertex in vertices {
            adjacencies[vertex] = []
        }
    }
    
    // the graphs vertices are the keys of the adjacency dictionary
    var vertices: [Vertex] {
        return Array(adjacencies.keys)
    }
    
    var sortedEdges: [Edge] {
        return Array(adjacencies.values.flatMap({ $0 })).sorted(by: { $0.weight < $1.weight })
    }
    
    @discardableResult
    mutating func addVertex(_ element: Element) -> Vertex {
        let vertex = Vertex(index: adjacencies.count, element: element)
        adjacencies[vertex] = []
        return vertex
    }
    
    @discardableResult
    mutating func addVertex(_ vertex: Vertex) -> Vertex {
        adjacencies[vertex] = []
        return vertex
    }
    
    // An undirected graph could be seen as a bidirectional graph, where every edge could be traversed in both directions
    mutating func addEdge(_ edge: Edge, _ directed: Bool = false) {
        if !adjacencies.keys.contains(edge.source) {
            addVertex(edge.source)
        }
        
        if !adjacencies.keys.contains(edge.destination) {
            addVertex(edge.destination)
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

