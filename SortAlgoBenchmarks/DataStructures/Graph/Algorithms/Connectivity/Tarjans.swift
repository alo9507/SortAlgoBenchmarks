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
    
    static func sccs(for graph: Graph) -> [Int] {
        let UNVISITED = -1
        var n = graph.vertices.count
        var g = graph.adjacencies
        
        var id = -1
        var sccCount = 0
        
        var ids = Array(repeating: 0, count: n)
        var low = Array(repeating: 0, count: n)
        var onStack = Array(repeating: false, count: n)
        var stack = ArrayStack<Int>()
        
        func dfs(at: Int) {
            stack.push(at)
            onStack[at] = true
            id += 1
            ids[at] = id
            low[at] = id
            
            let vertex = graph.vertices.filter { (vertex) -> Bool in
                return Int(vertex.index)! == id
            }.first!
            
            let neighbors = graph.getEdges(from: vertex)
            
            for edge in neighbors {
                let to = Int(edge.destination.index)!
                if ids[to] == UNVISITED { dfs(at: to) }
                if onStack[to] { low[at] = min(low[at], low[to]) }
            }
            
            if ids[at] == low[at] {
                while let node = stack.pop() {
                    onStack[node] = false
                    low[node] = ids[at]
                    if node == at { break }
                }
                sccCount += 1
            }
        }
        
        func findSccs() -> [Int] {
            for i in stride(from: 0, to: n, by: 1) { ids[i] = UNVISITED }
            for i in stride(from: 0, to: n, by: 1) {
                if ids[i] == UNVISITED {
                    dfs(at: i)
                }
            }
            return low
        }
        
        // when id == lowlink[vertex] its the start of an SCC
        
        return findSccs()
    }
}
