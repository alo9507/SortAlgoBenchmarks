//
//  FloodFill.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/28/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

enum FloodFill<Graph: SortAlgoBenchmarks.Graph> where Graph.Element: Hashable {
    typealias Edge = Graph.Edge
    typealias Vertex = Edge.Vertex
    
    static func fill(with color: Int, startingFrom: Vertex, graph: inout Graph) -> Void {
        
    }
}
