//
//  TarjansTest.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 4/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

final class TarjansTest: XCTestCase {
    func test_tarjans() {
        var graph: AdjacencyList<String> {
            var graph = AdjacencyList<String>()
            
            let a = graph.addVertex(element: "A")
            let b = graph.addVertex(element: "B")
            let c = graph.addVertex(element: "C")
            let d = graph.addVertex(element: "D")
            let e = graph.addVertex(element: "E")
            let f = graph.addVertex(element: "F")
            let g = graph.addVertex(element: "G")
            let h = graph.addVertex(element: "H")
            let i = graph.addVertex(element: "I")
            
            
            let ab_undirected = GraphEdge(source: a, destination: b)
            let ac_undirected = GraphEdge(source: a, destination: c)
            graph.addEdge(ab_undirected)
            graph.addEdge(ac_undirected)
            
            let bd_directed = GraphEdge(source: b, destination: d)
            let cd_directed = GraphEdge(source: c, destination: d)
            graph.addEdge(bd_directed, directed: true)
            graph.addEdge(cd_directed, directed: true)
            
            let df_undirected = GraphEdge(source: d, destination: f)
            graph.addEdge(df_undirected)
            
            let eb_directed = GraphEdge(source: e, destination: b)
            graph.addEdge(eb_directed, directed: true)
            
            let ef_directed = GraphEdge(source: e, destination: f)
            graph.addEdge(ef_directed, directed: true)
            
            let ge_directed = GraphEdge(source: g, destination: e)
            graph.addEdge(ge_directed, directed: true)
            
            let eh_directed = GraphEdge(source: e, destination: h)
            graph.addEdge(eh_directed, directed: true)
            
            let hf_directed = GraphEdge(source: h, destination: f)
            let hg_directed = GraphEdge(source: h, destination: g)
            graph.addEdge(hf_directed, directed: true)
            graph.addEdge(hg_directed, directed: true)
            
            let ih_directed = GraphEdge(source: i, destination: h)
            let ig_directed = GraphEdge(source: i, destination: g)
            graph.addEdge(ih_directed)
            graph.addEdge(ig_directed)
            
            let ii_directed = GraphEdge(source: i, destination: i)
            graph.addEdge(ii_directed, directed: true)
            
            return graph
            
            XCTAssertEqual([1], Tarjans.sccs(for: graph))
        }
    }
}
