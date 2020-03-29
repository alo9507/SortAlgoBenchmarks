//
//  GraphEdge.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/3/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

struct GraphEdge<Element> {
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

extension GraphEdge: Equatable where Element: Equatable {}
extension GraphEdge: Hashable where Element: Hashable {}

extension Array where Element == GraphEdge<Int> {
    func describe() -> [String] {
        var edgeStrings: [String] = []
        self.forEach { (edge) in
            edgeStrings.append("\(edge.source.element)->\(edge.destination.element)")
        }
        return edgeStrings
    }
}
