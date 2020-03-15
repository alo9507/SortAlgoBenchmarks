//
//  DijkstrasTest.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/22/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

import XCTest
@testable import SortAlgoBenchmarks

private typealias Graph = AdjacencyList<String>
private typealias Vertex = Graph.Vertex

final class DijkstraTestCase: XCTestCase {
    private let (graph, a, b, c, d, e, f, g, h): (Graph, Vertex, Vertex, Vertex, Vertex, Vertex, Vertex, Vertex, Vertex) = {
        var graph = AdjacencyList<String>()
        
        let a = graph.addVertex("A")
        let b = graph.addVertex("B")
        let c = graph.addVertex("C")
        let d = graph.addVertex("D")
        let e = graph.addVertex("E")
        let f = graph.addVertex("F")
        let g = graph.addVertex("G")
        let h = graph.addVertex("H")
        
        for edge in [
            GraphEdge(source: a, destination: b, weight: 8),
            GraphEdge(source: a, destination: f, weight: 9),
            GraphEdge(source: a, destination: g, weight: 1),
            GraphEdge(source: b, destination: f, weight: 3),
            GraphEdge(source: b, destination: e, weight: 1),
            GraphEdge(source: c, destination: b, weight: 3),
            GraphEdge(source: c, destination: e, weight: 1),
            GraphEdge(source: c, destination: g, weight: 3),
            GraphEdge(source: d, destination: e, weight: 2),
            GraphEdge(source: f, destination: h, weight: 2),
            GraphEdge(source: g, destination: h, weight: 5)
            ] {
                graph.addEdge(edge)
        }
        
        return (graph, a, b, c, d, e, f, g, h)
    } ()
    
    func test_getShortestPath() {
        let shortestPath_ad = Dijkstra.getShortestPath(from: a, to: d, graph: graph)
        XCTAssertEqual(String(shortestPath: shortestPath_ad), "AGCED")
        
        let shortestPath_ab = Dijkstra.getShortestPath(from: a, to: b, graph: graph)
        XCTAssertEqual(String(shortestPath: shortestPath_ab), "AGCEB")
    }
}

private extension String {
    init?(shortestPath: [Graph.Edge]) {
        // when the source and destination of the path are the same
        guard !shortestPath.isEmpty else {
            return nil
        }
        
        // start string at the source of the path
        self = shortestPath.reduce(into: shortestPath[0].source.element, { (string, edge) in
            // append edge of each subsequent destination to the string
            string += edge.destination.element
        })
    }
}
