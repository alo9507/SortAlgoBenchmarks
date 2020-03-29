//
//  GraphBFS.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

extension AdjacencyList {
    func breadthFirstSearch(_ source: GraphVertex<Element>,
             _ augmentation: @escaping (GraphVertex<Element>) -> Void) {
        var queue = ArrayQueue<GraphVertex<Element>>()
        var visited: [GraphVertex<Element>: Bool] = [:]
        
        queue.enqueue(source)
        visited[source] = true
        
        while let vertex = queue.dequeue() {
            augmentation(vertex)
            for edge in getEdges(from: vertex) {
                if !visited[edge.destination, default: false] {
                    visited[edge.destination] = true
                    queue.enqueue(edge.destination)
                }
            }
        }
    }
}

// Coorectness proof
// Performance proof
