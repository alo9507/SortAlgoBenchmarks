//
//  GraphEdge.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/3/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// With two GraphVertex you can define a GraphEdge
struct GraphEdge<Element> {
    // An edge's vertices will be a GraphVertex with a matching Element type
    typealias Vertex = GraphVertex<Element>
    
    let source: Vertex
    let destination: Vertex
    let weight: Double
    
    init(source: Vertex, destination: Vertex, weight: Double = 0.0) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
}

// To add edges to a PriorityQueue, they'll have to be Equatable
extension GraphEdge: Equatable where Element: Equatable {}
extension GraphEdge: Hashable where Element: Hashable {}
