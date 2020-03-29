//
//  TopologicalSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

extension AdjacencyList {
    public func topologicalSort() -> [GraphVertex<Element>] {
        let startVertices = calculateInDegreeOfNodes().filter({_, indegree in
            return indegree == 0
        }).map({ node, indegree in
            return node
        })
        
        var result = [GraphVertex<Element>]()
        for vertex in startVertices {
            result = depthFirstSearch(vertex) + result
        }
        
        return result
    }
    
    typealias InDegree = Int
    
    public func calculateInDegreeOfNodes() -> [GraphVertex<Element>: InDegree] {
        var inDegrees = [GraphVertex<Element>: InDegree]()
        
        for (node, _) in adjacencies {
            inDegrees[node] = 0
        }
        
        for edge in sortedEdges {
            inDegrees[edge.destination, default: 0] += 1
        }
        
        return inDegrees
    }
}


