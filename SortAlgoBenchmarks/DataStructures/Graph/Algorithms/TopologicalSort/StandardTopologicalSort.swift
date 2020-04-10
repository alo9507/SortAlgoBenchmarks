//
//  TopologicalSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

enum StandardTopologicalSort<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
    typealias Edge = Graph.Edge
    typealias Vertex = Edge.Vertex
    
    static func topsort(graph: Graph) -> [Vertex] {
        let inDegrees = calculateInDegreeOfNodes(in: graph)
        
        let startNodes = graph.vertices.filter { (vertex) -> Bool in
            return inDegrees[vertex] == 0
        }
        
        return []
    }
    
    static public func calculateInDegreeOfNodes(in graph: Graph) -> [Vertex : Int] {
        var inDegrees = [Vertex: Int]()
        
        for (vertex, _) in graph.adjacencies {
            inDegrees[vertex] = 0
        }
        
        for (_, edges) in graph.adjacencies {
            for edge in edges {
                inDegrees[edge.destination]! += 1
            }
        }
        
        return inDegrees
    }
}

extension AdjacencyList {
    public func calculateInDegreeOfNodes() -> [Vertex : Int] {
        var inDegrees = [Vertex: Int]()
        
        for (vertex, _) in adjacencies {
            inDegrees[vertex] = 0
        }
        
        for (_, edges) in adjacencies {
            for edge in edges {
                inDegrees[edge.destination]! += 1
            }
        }
        
        return inDegrees
    }
}


