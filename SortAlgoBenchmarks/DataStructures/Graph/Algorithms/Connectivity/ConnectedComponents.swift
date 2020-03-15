//
//  ConnectedComponents.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

extension AdjacencyList {
    func connectedComponents() -> [Int: [GraphVertex<Element>]] {
         var unionFind = UnionFind<GraphVertex<Element>>()
        for vertex in vertices {
            unionFind.addSetWith(vertex)
        }
        
        for edge in sortedEdges {
            let v1 = edge.source
            let v2 = edge.destination
            
            if !unionFind.inSameSet(v1, and: v2) {
                unionFind.unionSetsContaining(v1, and: v2)
            }
        }
        
        return unionFind.allSets()
    }
}
