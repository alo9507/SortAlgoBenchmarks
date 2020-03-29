//
//  Dijkstras.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/22/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/// Returns a single-source shortest path to all other vertices
enum Dijkstra<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
    typealias Edge = Graph.Edge
    typealias Vertex = Edge.Vertex
    
    static func getEdges(alongPathsFrom source: Vertex, graph: Graph) -> [Vertex: Edge] {
        var shortestPathTree: [Vertex: Edge] = [:]
        
        /// The reaching cost is a dynamically updated value representing the current shortest path from source to destination
        /// - Parameter destination: Destination vertex for which the reaching cost is being requested
        func getReachingCost(to destination: Vertex) -> Double {
            return getShortestPath(to: destination, edgesAlongPath: shortestPathTree)
                .map { $0.weight }
                .reduce(0, +)
        }
        
        /// Helper method for determining whether or not a shortest path update is needed for given edge leading to vertex
        /// - Parameters:
        ///   - vertex: The source vertex
        ///   - outgoingEdge: Outgoing edges from source
        func isUpdatable(_ vertex: Vertex, _ outgoingEdge: Edge) -> Bool {
            let edgePointsBackToSource = outgoingEdge.destination == source
            if edgePointsBackToSource {
                return false
            }
            
            let isUnvisited = (shortestPathTree[outgoingEdge.destination] == nil)
            if isUnvisited {
                return true
            }
            
            // An edge from u to v can be relaxed if
            // d[u] + w(u, v) <= d[v]
            // where:
            // d[u] and d[v] is the reaching cost of u and v respectively
            // w(u, v) is the weight of the edge connecting u and v,
            let edgeCanBeRelaxed = getReachingCost(to: vertex) + outgoingEdge.weight < getReachingCost(to: outgoingEdge.destination)
            if edgeCanBeRelaxed {
                return true
            }
            
            return false
        }
        
        var priorityQueue = PriorityQueue { getReachingCost(to: $0) < getReachingCost(to: $1) }
        priorityQueue.enqueue(source)
        
        while let vertex = priorityQueue.dequeue() {
            graph.getEdges(from: vertex)
                .filter { outgoingEdge in isUpdatable(vertex, outgoingEdge) }
                .forEach { (updatableEdgeFromVertex) in
                    shortestPathTree[updatableEdgeFromVertex.destination] = updatableEdgeFromVertex
                    priorityQueue.enqueue(updatableEdgeFromVertex.destination)
            }
        }
        
        return shortestPathTree
    }
    
    /// Returns the current shortest path leading to the destination
    /// - Parameters:
    ///   - destination: Destination vertex
    ///   - edgesAlongPath: Parent-link representation of paths back to source vertex
    static func getShortestPath(to destination: Vertex, edgesAlongPath: [Vertex: Edge]) -> [Edge] {
        var shortestPath: [Edge] = []
        var destination = destination
        
        while let edge = edgesAlongPath[destination] {
            shortestPath = [edge] + shortestPath
            destination = edge.source
        }
        
        return shortestPath
    }
    
    static func relax(_ edge: Edge) {
        
    }
    
    static func getShortestPath(from source: Vertex, to sink: Vertex, graph: Graph) -> [Edge] {
        return getShortestPath(to: sink, edgesAlongPath: getEdges(alongPathsFrom: source, graph: graph))
    }
}
