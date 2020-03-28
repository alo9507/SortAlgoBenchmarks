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
    
    static func getMinimumSpanningTree(for graph: Graph) -> (cost: Double, minimumSpanningTree: MinimumSpanningTree) {
        var cost = 0.0
        var minimumSpanningTree = MinimumSpanningTree(vertices: graph.vertices)
        
        guard let start = graph.vertices.first else {
            return (cost, minimumSpanningTree)
        }
        
        var visited: Set<Vertex> = []
        var priorityQueue = PriorityQueue<Edge> { $0.weight < $1.weight }
        
        // the edges that are available are the one's who's destinations haven't been visited yet
        func enqueueAvailableEdges(for vertex: Vertex) {
            for edge in graph.getEdges(from: vertex) where !visited.contains(edge.destination) {
                priorityQueue.enqueue(edge)
            }
        }
        
        visited.insert(start)
        enqueueAvailableEdges(for: start)
        
        // Prim's will greedily search for edges until the PQ is empty
        while let lightestEdge = priorityQueue.dequeue() {
            let destination = lightestEdge.destination
            
            // if you've already visited the destination, then skip it, and dequeue the next lightest edge
            // how would such a destination even get into here?
            guard !visited.contains(destination) else {
                continue
            }
            
            // otherwise mark the destination as visite
            visited.insert(destination)
            
            // add its cost to the total
            cost += lightestEdge.weight
            
            // and add edge to the mst
            minimumSpanningTree.addEdge(lightestEdge)
            
            // enqueue the available edges for the destination vertex
            enqueueAvailableEdges(for: destination)
        }
        
        return (cost, minimumSpanningTree)
    }
}
