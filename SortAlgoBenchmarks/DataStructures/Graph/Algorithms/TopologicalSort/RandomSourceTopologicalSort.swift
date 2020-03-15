//
//  RandomSourceTopologicalSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

extension AdjacencyList {
    public func topologicalSortRandomSource() -> [GraphVertex<Element>] {
        var stack = [GraphVertex<Element>]()
        
        var visited = [GraphVertex<Element>: Bool]()
        for (node, _) in adjacencies {
            visited[node] = false
        }
        
        func depthFirstSearch(_ source: GraphVertex<Element>) {
            for edge in getEdges(from: source) {
                if !visited[edge.destination, default: false] {
                    depthFirstSearch(edge.destination)
                }
            }
            stack.append(source)
            visited[source] = true
        }
        
        for (node, _) in visited {
            if let seen = visited[node], !seen {
                depthFirstSearch(node)
            }
        }
        
        return stack.reversed()
    }
}
