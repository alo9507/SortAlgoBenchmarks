//
//  GraphDFS.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// Time Complexity: 0(V + E), aka 0(number of node visits + number of edges)
/// Recursive implementation of depth first search
enum RecursiveGraphDFS<Graph: SortAlgoBenchmarks.Graph>  where Graph.Element == String {
    typealias Vertex = Graph.Vertex
    
    static func depthFirstSearch(for graph: Graph, from source: Vertex) -> [Vertex] {
        var visited = Set<Vertex>()
        var result = [Vertex]()
        
        func dfs(from source: Vertex) {
            // O(1) per node visit
            visited.insert(source)
            result.append(source)
            let neighbors = graph.getEdges(from: source)
            
            // O(E)
            for neighbor in neighbors where !visited.contains(neighbor.destination) {
                dfs(from: neighbor.destination)
            }
        }
        
        dfs(from: source)
        return result
    }
}

enum IterativeGraphDFS<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
    typealias Vertex = Graph.Vertex
    
    static func depthFirstSearch(for graph: Graph, from source: Vertex) -> [Vertex] {
        var visited = Set<Vertex>()
        var result = [Vertex]()
        var stack = ArrayStack<Vertex>()
        
        stack.push(source)
        
        while let vertex = stack.pop() {
            // O(1) per node visit
            result.append(vertex)
            visited.insert(vertex)
            let neighbors = graph.getEdges(from: vertex)
            
            // O(E)
            for neighbor in neighbors where !visited.contains(neighbor.destination) {
                stack.push(neighbor.destination)
            }
        }
        
        return result
    }
}
