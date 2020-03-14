//
//  Kruskal.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

func minimumSpanningTreeKruskal<T>(for graph: AdjacencyList<T>) -> (cost: Double, tree: AdjacencyList<T>) {
    var cost: Double = 0
    var tree = AdjacencyList<T>()
    let sortedEdgesByWeight = graph.sortedEdges
    
    // initialize the union find with the elements of the vertices
    // if this union find took vertices then maybe you could hash the index as well
    var unionFind = UnionFind<T>()
    for vertex in graph.vertices {
        unionFind.addSetWith(vertex.element)
    }
    
    for edge in sortedEdgesByWeight {
        let v1 = edge.source
        let v2 = edge.destination
        
        if !unionFind.inSameSet(v1.element, and: v2.element) {
            cost += edge.weight
            tree.addEdge(edge)
            unionFind.unionSetsContaining(v1.element, and: v2.element)
            print(unionFind.allSets())
        }
    }
    
    return (cost: cost, tree)
}