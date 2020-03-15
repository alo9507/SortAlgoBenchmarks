//
//  BidirectionalSearchTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class BidirectionalSearchTest: XCTestCase {
    func test_bidirectionalSearch() {
        var graph = AdjacencyList<String>()

        let a = graph.addVertex("A")
        let b = graph.addVertex("B")
        let c = graph.addVertex("C")
        let d = graph.addVertex("D")
        let e = graph.addVertex("E")

        let ab = GraphEdge(source: a, destination: b, weight: 0)
        let ac = GraphEdge(source: a, destination: c, weight: 0)
        let ad = GraphEdge(source: a, destination: d, weight: 0)
        let ae = GraphEdge(source: a, destination: e, weight: 0)
        let bc = GraphEdge(source: b, destination: c, weight: 0)
        let bd = GraphEdge(source: b, destination: d, weight: 0)
        let ce = GraphEdge(source: c, destination: e, weight: 0)
        let de = GraphEdge(source: d, destination: e, weight: 0)

        for edge in [ab, ac, ad, ae, bc, bd, ce, de] {
            graph.addEdge(edge)
        }
        
        print(graph.bidirectionalSearch(from: a, to: d))
    }
}
