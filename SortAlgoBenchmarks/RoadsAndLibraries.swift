//
//  RoadsAndLibraries.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

public func roadsAndLibraries(n: Int, c_lib: Int, c_road: Int, cities: [[Int]]) -> Int {
    var totalCost = 0
    var graph: AdjacencyList<Int> = AdjacencyList<Int>()
    
    // construct graph
    for city in cities {
        let v1 = graph.addVertex(city[0])
        let v2 = graph.addVertex(city[1])
        
        let edge = GraphEdge(source: v1, destination: v2, weight: Double(c_road))
        graph.addEdge(edge)
    }
    print(graph)
    
    // create union find of the independent components to determine library costs
    var unionFind = UnionFind<Int>()
    for vertex in graph.vertices {
        unionFind.addSetWith(vertex.element)
    }
    for edge in graph.sortedEdges {
        let v1 = edge.source
        let v2 = edge.destination
        
        // an edge exists between v1 and v2, so they belong in the same set
        if !unionFind.inSameSet(v1.element, and: v2.element) {
            unionFind.unionSetsContaining(v1.element, and: v2.element)
        }
    }
    print(unionFind.allSets())
    
    // determine distinct edges cycles for total road costs. subtract 1 per cycle
    
    return totalCost
}
