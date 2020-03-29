//
//  PrimEager.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/28/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/// Lazy-implementation of Prim's algorithm
/// It's "lazy" because we leaves items into the PQ that we know to be obsolete, i.e. both endpoints are already in the MST
/*
 TIME COMPLEXITY: E log E
    Dequeue
        Frequency: E
        Cost per Op: log E
    Insert
        Frequency: E
        Cost per Op: log E
 
 SPACE COMPLEXITY:
 */
enum PrimEager<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
    typealias Edge = Graph.Edge
    typealias Vertex = Edge.Vertex
    typealias MinimumSpanningTree = AdjacencyList<Graph.Element>
    
    /// Returns MST for graph
    /// - Parameter graph: A connected and undirected graph
    static func getMinimumSpanningTree(for graph: Graph) -> (cost: Double, minimumSpanningTree: MinimumSpanningTree) {
        var totalCost = 0.0
        var minimumSpanningTree = MinimumSpanningTree(vertices: graph.vertices)
        var visited: Set<Vertex> = []
        var priorityQueue = PriorityQueue<Edge> { $0.weight < $1.weight }
        
        guard let start = graph.vertices.first else {
            return (totalCost, minimumSpanningTree)
        }
        
        func enqueueUntraversedEdges(for vertex: Vertex) {
            for edge in graph.getEdges(from: vertex) where !visited.contains(edge.destination) {
                priorityQueue.enqueue(edge)
            }
        }
        
        visited.insert(start)
        enqueueUntraversedEdges(for: start)
        
        while let edge = priorityQueue.dequeue() {
            let destination = edge.destination
            
            guard !visited.contains(destination) else {
                continue
            }
            
            visited.insert(destination)
            totalCost += edge.weight
            minimumSpanningTree.addEdge(edge)
            enqueueUntraversedEdges(for: destination)
        }
        
        return (totalCost, minimumSpanningTree)
    }
}
