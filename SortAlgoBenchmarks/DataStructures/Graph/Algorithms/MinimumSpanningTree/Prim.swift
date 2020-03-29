//
//  Prims.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/23/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// O (E log E) to find MST

// A minimum spanning tree has V - 1 edges

enum Prim<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
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
        
        while let lightestEdge = priorityQueue.dequeue() {
            let destination = lightestEdge.destination
            
            guard !visited.contains(destination) else {
                continue
            }
            
            visited.insert(destination)
            totalCost += lightestEdge.weight
            minimumSpanningTree.addEdge(lightestEdge)
            enqueueUntraversedEdges(for: destination)
        }
        
        return (totalCost, minimumSpanningTree)
    }
}
