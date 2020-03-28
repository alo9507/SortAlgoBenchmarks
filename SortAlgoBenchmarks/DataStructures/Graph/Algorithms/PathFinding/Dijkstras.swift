//
//  Dijkstras.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/22/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// caseless enumeration generic on a graph type

// Gives shortest path tree (SPT) from a source vertex to ALL other vertices

// Works on directed and undirected graph

// Min PQ not needed for Dijkstra's

enum Dijkstra<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
    typealias Edge = Graph.Edge
    typealias Vertex = Edge.Vertex
    
    // build path from destination vertex back to source vertex
    // this will rely on having stored the appropriate edge for each vertex along the path
    
    // performs edge relaxation on each source passed in
    static func getEdges(alongPathsFrom source: Vertex, graph: Graph) -> [Vertex: Edge] {
        var shortestPathTree: [Vertex: Edge] = [:]
        
        func getReachingCost(to destination: Vertex) -> Double {
            return getShortestPath(to: destination, edgesAlongPath: shortestPathTree)
                .map { $0.weight }
                .reduce(0, +)
        }
        
        func isUpdatable(_ vertex: Vertex, _ edge: Edge) -> Bool {
            let edgePointsBackToSource = edge.destination == source
            if edgePointsBackToSource {
                return false
            }
            
            let isUnvisited = (shortestPathTree[edge.destination] == nil)
            if isUnvisited {
                return true
            }
            
            // An edge from u to v can be relaxed if
            // d[u] + w(u, v) <= d[v]
            // where:
            // d[u] and d[v] is the reaching cost of u and v respectively
            // w(u, v) is the weight of the edge connecting u and v,
            let edgeCanBeRelaxed = getReachingCost(to: vertex) + edge.weight < getReachingCost(to: edge.destination)
            if edgeCanBeRelaxed {
                return true
            }
            
            return false
        }
        
        var priorityQueue = PriorityQueue { getReachingCost(to: $0) < getReachingCost(to: $1) }
        priorityQueue.enqueue(source)
        
        while let vertex = priorityQueue.dequeue() {
            graph.getEdges(from: vertex)
                .filter { isUpdatable(vertex, $0) }
                .forEach { (updatableEdgeFromVertex) in
                    shortestPathTree[updatableEdgeFromVertex.destination] = updatableEdgeFromVertex // records the path it took to get this A) new weight update, or B) updated lower shortest path update
                    priorityQueue.enqueue(updatableEdgeFromVertex.destination)
            }
        }
        
        return shortestPathTree
    }
    
    /// getShortestPath
    /// - Parameters:
    ///   - destination: Destination vertex
    ///   - edgesAlongPath: Dictionary along paths back to source vertex
    static func getShortestPath(to destination: Vertex, edgesAlongPath: [Vertex: Edge]) -> [Edge] {
        var shortestPath: [Edge] = []
        
        var destination = destination
        
        // loop backwards from destination to the source
        // stops looping until you hit the source since we won't be storing an edge for the source
        while let edge = edgesAlongPath[destination] {
            shortestPath = [edge] + shortestPath
            destination = edge.source
        }
        
        return shortestPath
    }
    
    static func getShortestPath(from source: Vertex, to destination: Vertex, graph: Graph) -> [Edge] {
        return getShortestPath(to: destination, edgesAlongPath: getEdges(alongPathsFrom: source, graph: graph))
    }
}
