//
//  Kruskal.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/// Kruskal's operates by adding each edge in ascending order to the MST if it does not create a cycle, i.e. is already part of the same set

/*
 TIME COMPLEXITY: E log E (linearithmic)
 Build PQ:
    Frequency: 1
    Time per Op: E
 Delete Min:
     Frequency: E
     Time per Op: log E
 Union (amortized time using weighted quick union with path compression):
     Frequency: V
     Time per Op: log*V
 Union (amortized time using weighted quick union with path compression):
     Freuquency: E
     Time per Op: log*V
 
 SPACE COMPLEXITY:
    
 */
enum Kruskal<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
    typealias Edge = Graph.Edge
    typealias Vertex = Edge.Vertex
    typealias MinimumSpanningTree = AdjacencyList<Graph.Element>
    
    /// Returns MST for graph
    /// - Parameter graph: A connected and undirected graph
    static func minimumSpanningTree(for graph: Graph) -> (cost: Double, mst: MinimumSpanningTree) {
        var totalCost: Double = 0
        var minimumSpanningTree = MinimumSpanningTree(vertices: graph.vertices)
        var unionFind = UnionFind<Vertex>(graph.vertices)
        var priorityQueue = PriorityQueue(graph.edges) { $0.weight < $1.weight }
        
        while let edge = priorityQueue.dequeue() {
            if minimumSpanningTree.edges.count == graph.vertices.count - 1 { break }
            
            let v1 = edge.source
            let v2 = edge.destination
            
            if !unionFind.inSameSet(v1, and: v2) {
                totalCost += edge.weight
                minimumSpanningTree.addEdge(edge)
                unionFind.unionSetsContaining(v1, and: v2)
            }
        }
        
        return (cost: totalCost, minimumSpanningTree)
    }
}
