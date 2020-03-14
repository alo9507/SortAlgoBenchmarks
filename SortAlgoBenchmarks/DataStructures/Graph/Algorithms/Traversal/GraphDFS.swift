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

func graphDfs<T>(_ graph: AdjacencyList<T>,
                 _ source: GraphVertex<T>,
                 _ augmentation: @escaping (T) -> Void) {
    var visited: [GraphVertex<T>: Bool] = [:]
    recurseDfs(graph, source, &visited, augmentation)
}

func findComponents<T>(_ graph: AdjacencyList<T>,
                       _ source: GraphVertex<T>,
                       _ augmentation: @escaping (T) -> Void) {
    var visited: [GraphVertex<T>: Bool] = [:]
    
    var count = 0
    var components: [Int] = []
    recurseDfs(graph, source, &visited, augmentation)
}

func recurseDfs<T>(_ graph: AdjacencyList<T>,
                   _ source: GraphVertex<T>,
                   _ visited: inout [GraphVertex<T>: Bool],
                   _ augmentation: @escaping (T) -> Void) {
    if visited[source] == true { return }
    visited[source] = true
    augmentation(source.element)
    
    let neighbors = graph.getEdges(from: source)
    
    for next in neighbors {
        recurseDfs(graph, next.destination, &visited, augmentation)
    }
}
