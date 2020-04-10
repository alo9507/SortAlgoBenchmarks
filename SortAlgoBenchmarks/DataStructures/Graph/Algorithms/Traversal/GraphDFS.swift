//
//  GraphDFS.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// O(V + E)
import Foundation

/*
 A Depth-first Search plunges depth first into a graph without regard for which edge it takes next until it cannot go any further
 It then backtracks and continues
 */

extension AdjacencyList {
    typealias Augmentation = (GraphVertex<Element>) -> Void
    
    func depthFirstSearch(_ source: GraphVertex<Element>,
                          previsit: Augmentation? = nil,
                          postvisit: Augmentation? = nil) -> [GraphVertex<Element>] {
        var result = [GraphVertex<Element>]()
        var visited = [GraphVertex<Element>: Bool]()
        
        func recurseDfs(_ source: GraphVertex<Element>) {
            if visited[source] == true { return }
            visited[source] = true
            
            let neighbors = getEdges(from: source)
            
            previsit?(source)
            for next in neighbors {
                if !visited[next.destination, default: false] {
                    recurseDfs(next.destination)
                }
            }
            postvisit?(source)
            result = [source] + result
        }
        
        recurseDfs(source)
        return result
    }
}

// iterative dfs

enum IterativeGraphDFS<Graph: SortAlgoBenchmarks.Graph>  where Graph.Element == String {
    typealias Vertex = Graph.Vertex
    static func depthFirstSearch(graph: Graph, _ source: Vertex) -> [Vertex] {
        var result = [Vertex]()
        var visited = Set<Vertex>()
        var stack = ArrayStack<Vertex>()
        
        stack.push(source)
        
        while !stack.isEmpty {
//            print(stack.verticesDescription)
            let vertex = stack.pop()!
            guard !visited.contains(vertex) else { continue }
            
            visited.insert(vertex)
            print(vertex.element)
            let neighbors = graph.getEdges(from: vertex)
            
            for next in neighbors where !visited.contains(next.destination) {
                stack.push(next.destination)
            }
            result = result + [vertex]
        }
        
        return result
    }
}
