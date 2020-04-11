//
//  TopologicalSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

enum StandardTopologicalSort<Graph: SortAlgoBenchmarks.Graph> where Graph.Element == String {
    typealias Edge = Graph.Edge
    typealias Vertex = Edge.Vertex
    
    static func topsort(graph: Graph) -> [Vertex] {
        let inDegrees = calculateInDegreeOfNodes(in: graph)
        var visited = Set<Vertex>()
        
        let startNodes = graph.vertices.filter { (vertex) -> Bool in
            return inDegrees[vertex] == 0
        }
        
        var result = [Vertex]()
        
        func modifiedDepthFirstSearch(from source: Vertex) -> [Vertex] {
            var result = [Vertex]()
            
            let neighbors = graph.getEdges(from: source)
            
            for neighbor in neighbors where !visited.contains(neighbor.destination) {
                result = modifiedDepthFirstSearch(from: neighbor.destination) + result
            }
            
            visited.insert(source)
            return [source] + result
        }
        
        for startNode in startNodes {
            result = modifiedDepthFirstSearch(from: startNode) + result
        }
        
        return result
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


