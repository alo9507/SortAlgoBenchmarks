//
//  Kruskal.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

///
/// Kruskal's operates by adding each edge in ascending order to the MST if it does not create a cycle, i.e. is already part of the same set
enum Kruskal<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
    typealias Edge = Graph.Edge
    typealias Vertex = Edge.Vertex
    typealias MinimumSpanningTree = AdjacencyList<Graph.Element>
    
    /// Returns MST for graph
    /// - Parameter graph: A connected and undirected graph
    static func minimumSpanningTree(for graph: Graph) -> (cost: Double, mst: MinimumSpanningTree) {
        var totalCost: Double = 0
        var minimumSpanningTree = MinimumSpanningTree(vertices: graph.vertices)
        var unionFind = UnionFind<Vertex>()
        var priorityQueue = PriorityQueue(graph.edges) { $0.weight < $1.weight }
        
        // initialize the union find with the elements of the vertices
        // if this union find took vertices then maybe you could hash the index as well
        graph.vertices.map({ unionFind.addSetWith($0) })
        
        while let edge = priorityQueue.dequeue() {
            let v1 = edge.source
            let v2 = edge.destination
            
            // if they're already in the same set, then a previous (ergo less costly) edge
            // has already been added to the mst
            if !unionFind.inSameSet(v1, and: v2) {
                totalCost += edge.weight
                minimumSpanningTree.addEdge(edge)
                unionFind.unionSetsContaining(v1, and: v2)
            }
        }
        
        return (cost: totalCost, minimumSpanningTree)
    }
}
