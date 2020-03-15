//
//  Dijkstras.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/22/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// caseless enumeration generic on a graph type
enum Dijkstra<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
    typealias Edge = Graph.Edge
    typealias Vertex = Edge.Vertex
    
    static func getEdges(alongPathsFrom source: Vertex, graph: Graph) -> [Vertex: Edge] {
        var edges: [Vertex: Edge] = [:]
        
        func getWeight(to destination: Vertex) -> Double {
            return getShortestPath(to: destination, edgesAlongPath: edges)
                .map { $0.weight }
                .reduce(0, +)
        }
        
        // use a min priority queue comparing vertices by their total path weights
        var priorityQueue = PriorityQueue { getWeight(to: $0) < getWeight(to: $1) }
        
        // begin search at source vertex
        priorityQueue.enqueue(source)
        
        // the search will continue until the PQ is empty
        while let vertex = priorityQueue.dequeue() {
            graph.getEdges(from: vertex)
            // reject edges that connect back to the source
                .filter {
                    $0.destination == source ? false
                        : edges[$0.destination] == nil
                        || getWeight(to: vertex) + $0.weight < getWeight(to: $0.destination)
                }
                // at this point we only have the lowest cost edges
            .forEach { (newEdgeFromVertex) in
                edges[newEdgeFromVertex.destination] = newEdgeFromVertex
                
                // the search will now continue from the lowest cost path
                priorityQueue.enqueue(newEdgeFromVertex.destination)
            }
        }
        
        return edges
    }
    
    /// Mechanism to build the path from a destination vertex back to a source vertex
    /// This will rely on having stored the appropriate edge for each vertex along the path
    /// - Parameters:
    ///   - destination: where you want to go
    ///   - edgesAlongPath: dictionary of edges along the paths back to a source vertex
    static func getShortestPath(to destination: Vertex, edgesAlongPath: [Vertex: Edge]) -> [Edge] {
        var shortesPath: [Edge] = []
        
        // begin at destination vertex passed in
        var destination = destination
        
        // loop until there isn't an edge corresponding to what you'll assign destination to be
        while let edge = edgesAlongPath[destination] {
            // add edges to the path and work back to the source by reassigning destination to the conencted vertex
            shortesPath = [edge] + shortesPath
            
            // the loop will end when you hit the source since you won't be storing an edge for the source
            destination = edge.source
        }
        
        return shortesPath
    }
    
    static func getShortestPath(from source: Vertex, to destination: Vertex, graph: Graph) -> [Edge] {
        return getShortestPath(to: destination, edgesAlongPath: getEdges(alongPathsFrom: source, graph: graph))
    }
}
