//
//  Kruskal.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

func minimumSpanningTreeKruskal<T>(for graph: AdjacencyList<T>) -> (cost: Double, mst: AdjacencyList<T>) {
    var totalCost: Double = 0
    var mst = AdjacencyList<T>()
    var unionFind = UnionFind<T>()
    
    // initialize the union find with the elements of the vertices
    // if this union find took vertices then maybe you could hash the index as well
    graph.vertices.map({ unionFind.addSetWith($0.element) })
    
    for edge in graph.sortedEdges {
        let v1 = edge.source
        let v2 = edge.destination
        
        // if they're already in the same set, then a previous (ergo less costly) edge
        // has already been added to the mst
        if !unionFind.inSameSet(v1.element, and: v2.element) {
            totalCost += edge.weight
            mst.addEdge(edge)
            unionFind.unionSetsContaining(v1.element, and: v2.element)
        }
    }
    
    return (cost: totalCost, mst)
}
