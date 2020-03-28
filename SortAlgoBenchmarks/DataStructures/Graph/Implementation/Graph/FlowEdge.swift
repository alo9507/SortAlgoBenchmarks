//
//  FlowEdge.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/26/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

struct FlowEdge<Element> {
    typealias Vertex = GraphVertex<Element>
    
    let source: Vertex
    let destination: Vertex
    let capacity: Int
    let flow: Int
    
    init(source: FlowEdge<Element>.Vertex, destination: FlowEdge<Element>.Vertex, capacity: Int, flow: Int) {
        self.source = source
        self.destination = destination
        self.capacity = capacity
        self.flow = flow
    }
}
