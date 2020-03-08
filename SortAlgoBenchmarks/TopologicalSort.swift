//
//  TopologicalSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

extension AdjacencyList {
    static func topologicalSort(_ vertices: Int, _ edges: [[Int]]) -> [Int] {
        var sortedOrder: [Int] = []
        if vertices <= 0 { return sortedOrder }
        
        // A) Initialize the graph
        var inDegree: [Int: Int] = Dictionary()
        var graph: [Int: [Int]] = Dictionary()
        for i in stride(from: 0, to: vertices, by: 1) {
            inDegree[i] = 0
            graph[i] = [Int]()
        }
        
        // B) Build the graph
        for i in stride(from: 0, to: edges.count, by: 1) {
            let parent: Int = edges[i][0]
            let child = edges[i][1]
            graph[parent]?.append(child)
            inDegree[child] = inDegree[child, default: 0] + 1
        }
        
        // C) Find all sources, i.e. vertices with in-degree of 0
        var sources: ArrayQueue<Int> = ArrayQueue()
        for (_, entry) in inDegree.enumerated() {
            if entry.value == 0 {
                sources.enqueue(entry.key)
            }
        }
        
        // D) For each source, add it to the sortedOrder and subtract one from all of its children's in-degrees
        //    If a child's in-degree becomes zero, enqueue it to the sources queue
        while !sources.isEmpty {
            let vertex = sources.dequeue()!
            sortedOrder.append(vertex)
            let children = graph[vertex]! // get the node's children to decrement their in-degrees
            for child in children {
                inDegree[child] = inDegree[child, default: 0] - 1
                if inDegree[child] == 0 {
                    sources.enqueue(child)
                }
            }
        }
        
        // Topological sort is not possible as the graph has a cycle
        if sortedOrder.count != vertices {
            return []
        }
        
        return sortedOrder
    }
}
