//
//  KahnsTopologicalSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

enum KahnsTopologicalSort<Graph: SortAlgoBenchmarks.Graph> {
    typealias Vertex = Graph.Vertex
    
    static func topsort(for graph: Graph) -> [Vertex] {
        var inDegrees = calculateInDegreesOfNodes(for: graph)
        
        var leaders = graph.vertices.filter { inDegrees[$0] == 0 }
        
        var l = 0
        while l < leaders.count {
            for edge in graph.getEdges(from: leaders[l]) {
                inDegrees[edge.destination]! -= 1
                if inDegrees[edge.destination]! == 0 {
                    leaders.append(edge.destination)
                }
            }
            l += 1
        }
        
        return leaders
    }
    
    static func calculateInDegreesOfNodes(for graph: Graph) -> [Vertex: Int] {
        var inDegress = [Vertex: Int]()
        
        for vertex in graph.vertices {
            inDegress[vertex] = 0
        }
        
        for (_, edges) in graph.adjacencies {
            for edge in edges {
                inDegress[edge.destination]! += 1
            }
        }
        
        return inDegress
    }
}
