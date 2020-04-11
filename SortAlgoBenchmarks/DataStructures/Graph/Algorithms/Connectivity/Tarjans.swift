//
//  StronglyConnectedComponents.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// Maintains a stack invariant to battle randomness DFS that makes low-link value tracking impossible

// Get min of low-link values during backtracking to propogate the common id

// Low-link update condition
// 1) Path exists from u to v
// 2) V must be on the stack

// O(V + E)

enum Tarjans<Graph: SortAlgoBenchmarks.Graph> {
    typealias Vertex = Graph.Vertex
    
    static func detectSCCs(for graph: Graph) -> [Int: [Vertex]] {
        var visited = Set<Vertex>()
        var stack = ArrayStack<Vertex>()
        var lowlinks = [Vertex: Int]()
        var result = [Int: [Vertex]]()
        
        // when id == lowlink[vertex] its the start of an SCC
        
        return result
    }
}
