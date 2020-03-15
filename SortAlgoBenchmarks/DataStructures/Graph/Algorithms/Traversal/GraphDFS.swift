//
//  GraphDFS.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// O(V + E)
import Foundation

/*
 A Depth-first Search plunges depth first into a graph without regard for which edge it takes next until it cannot go any further
 It then backtracks and continues
 */

extension AdjacencyList {
    func depthFirstSearch(_ source: GraphVertex<Element>, _ visited: inout [GraphVertex<Element>: Bool]) -> [GraphVertex<Element>] {
        var result = [GraphVertex<Element>]()
        recurseDfs(source, &visited, &result)
        return result
    }
    
    func recurseDfs(_ source: GraphVertex<Element>, _ visited: inout [GraphVertex<Element>: Bool], _ result: inout [GraphVertex<Element>]) {
        if visited[source] == true { return }
        visited[source] = true
        
        let neighbors = getEdges(from: source)
        
        for next in neighbors {
            if !visited[next.destination, default: false] {
                recurseDfs(next.destination, &visited, &result)
            }
        }
        
        result = [source] + result
    }
}
