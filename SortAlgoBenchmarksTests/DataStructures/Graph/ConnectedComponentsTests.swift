//
//  ConnectedComponentsTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

final class ConnectedComponentsTest: XCTestCase {
    func test_connectedComponents() {
        let graph: AdjacencyList<String> = {
            var graph = AdjacencyList<String>()
            
            let a1 = graph.addVertex(element: "A")
            let a2 = graph.addVertex(element: "AA")
            let a3 = graph.addVertex(element: "AAA")
            let a4 = graph.addVertex(element: "AAAA")
            
            let b1 = graph.addVertex(element: "B")
            let b2 = graph.addVertex(element: "BB")
            
            let c1 = graph.addVertex(element: "C")
            let c2 = graph.addVertex(element: "CC")
            
            let a1a2 = GraphEdge(source: a1, destination: a2)
            let a2a3 = GraphEdge(source: a2, destination: a3)
            let a3a4 = GraphEdge(source: a3, destination: a4)
            
            let b1b2 = GraphEdge(source: b1, destination: b2)
            
            let c1c2 = GraphEdge(source: c1, destination: c2)
            
            for edge in [a1a2, a2a3, a3a4, b1b2,c1c2] {
                graph.addEdge(edge)
            }
            
            return graph
        }()
        
        XCTAssertEqual(3, graph.connectedComponents().count)
    }
}
