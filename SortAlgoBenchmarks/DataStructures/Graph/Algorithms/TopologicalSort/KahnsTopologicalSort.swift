//
//  KahnsTopologicalSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

extension AdjacencyList {
    func kahnsTopologicalSort() -> [GraphVertex<Element>] {
        var nodes = calculateInDegreeOfNodes()
        
        // Find nodes with no predecessors and puth them into a new list
        // These are the leaders.
        // The leaders array eventually becomes the topologically sorted list
        var leaders = nodes.filter({ _, indegree in
            return indegree == 0
        }).map({node, _ in
            return node
        })
        
        /*
         Remove each of the leaders
         We do this by decrementing the in-degree of the nodes they poin to.
         As soon as such a node has itself no more predecessors
         it is added to the leaders array.
         This repeates until there are no more vertices left
         */
        var l = 0
        while l < leaders.count {
            if let edges = adjacencies[leaders[l]] {
                for neighbor in edges {
                    if let count = nodes[neighbor.destination] {
                        nodes[neighbor.destination] = count - 1
                        if count == 1 {
                            leaders.append(neighbor.destination)
                        }
                    }
                }
            }
            l += 1
        }
        
        if leaders.count != nodes.count {
            print("Error: graphs with cycles are not allowed")
        }
        
        return leaders
    }
}

/// Time Complexity: O(V + E)
// Only DAGs can have Topological Sortings. Use Tarjan's to detect these cycles
// Topological orderings are not unique
// Cyclic graphs cannot have a valid ordering
//enum KahnsTopologicalSort<Graph: SortAlgoBenchmarks.Graph> {
//    typealias Edge = Graph.Edge
//    typealias Vertex = Edge.Vertex
//
//    static func topsort(graph: Graph) -> [Vertex] {
//
//    }
//}
