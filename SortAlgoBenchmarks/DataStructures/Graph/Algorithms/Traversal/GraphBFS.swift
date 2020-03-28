//
//  GraphBFS.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

func graphBfs<T>(_ graph: AdjacencyList<T>, _ source: GraphVertex<T>, _ augmentation: @escaping (T) -> Void) {
    var queue = ArrayQueue<GraphVertex<T>>()
    var visited: [GraphVertex<T>: Bool] = [:]
    
    queue.enqueue(source)
    visited[source] = true
    
    while let vertex = queue.dequeue() {
        augmentation(vertex.element)
        for next in graph.getEdges(from: vertex) {
            if !visited[next.destination, default: false] {
                visited[next.destination] = true
                queue.enqueue(next.destination)
            }
        }
    }
}

// Coorectness proof
// Performance proof
