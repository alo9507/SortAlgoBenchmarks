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
    typealias Augmentation = (Element) -> Void
    
    func depthFirstSearch(_ source: GraphVertex<Element>,
                          _ visited: inout [GraphVertex<Element>: Bool],
                          previsit: Augmentation? = nil,
                          postvisit: Augmentation? = nil
                          ) -> [GraphVertex<Element>] {
        var result = [GraphVertex<Element>]()
        recurseDfs(source, &visited, &result, previsit, postvisit)
        return result
    }
    
    func recurseDfs(_ source: GraphVertex<Element>,
                    _ visited: inout [GraphVertex<Element>: Bool],
                    _ result: inout [GraphVertex<Element>],
                    _ previsit: Augmentation? = nil,
                    _ postvisit: Augmentation? = nil
                    ) {
        if visited[source] == true { return }
        visited[source] = true
        
        let neighbors = getEdges(from: source)
        
        previsit?(source.element)
        for next in neighbors {
            if !visited[next.destination, default: false] {
                recurseDfs(next.destination, &visited, &result, previsit, postvisit)
            }
        }
        postvisit?(source.element)
        result = [source] + result
    }
}
