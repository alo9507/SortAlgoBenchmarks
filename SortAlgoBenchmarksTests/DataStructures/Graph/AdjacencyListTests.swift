//
//  AdjacencyListTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/17/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class AdjacencyListTestCase: XCTestCase {
    func test_getPaths() {
        var graph = AdjacencyList<String>()
        
        let a = graph.addVertex(element: "A")
        let b = graph.addVertex(element: "B")
        let c = graph.addVertex(element: "C")
        let d = graph.addVertex(element: "D")
        let e = graph.addVertex(element: "E")
        
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
        
        // reversed versions of edges we explicitly added to the graph
        let cb = GraphEdge(source: c, destination: b, weight: 0)
        let db = GraphEdge(source: d, destination: b, weight: 0)
        
        XCTAssertEqual(graph.getPaths(from: a, to: e), [
            [ab, bc, ce],
            [ab, bd, de],
            [ac, cb, bd, de],
            [ac, ce],
            [ad, db, bc, ce],
            [ad, de],
            [ae]
        ])
    }
    
    func test_getIndexForPosition() {
        let grid: [[Int]] = [
            [0,1,2,3,4],
            [5,6,7,8,9]
        ]
        
        let graph = AdjacencyList(grid: grid)
        
        XCTAssertEqual(0, graph.indexForPosition((0,0), in: grid))
        
        XCTAssertEqual(4, graph.indexForPosition((0,4), in: grid))
        
        var fiveIndex = graph.indexForPosition((1,0), in: grid)
        XCTAssertEqual(5, fiveIndex)
        XCTAssertEqual(5, graph.getVertexWithIndex(fiveIndex)!.element)
        
        XCTAssertEqual(9, graph.indexForPosition((1,4), in: grid))
    }
    
    func test_initializeGraphWithAGrid() {
        let grid: [[Int]] = [
            [0,1,2,3,4],
            [5,6,7,8,9]
        ]
        
        let graph = AdjacencyList(grid: grid)
        
        XCTAssertEqual(10, graph.vertices.count)
        print(graph.vertices)
        XCTAssertEqual(26, graph.sortedEdges.count)
        
        let topLeftEdges = graph.getEdges(from: (0,0), in: grid)
        
//        var edgeStrings: [String] = []
//        topLeftEdges.forEach { (edge) in
//            edgeStrings.append("\(edge.source.element)->\(edge.destination.element)")
//        }
        
        XCTAssertEqual(topLeftEdges.describe(), ["0->1", "0->5"])
        
        print(graph.description)
    }
    
    func test_description() {
        var graph = AdjacencyList<String>()
        
        let singapore = graph.addVertex(element: "Singapore")
        let tokyo = graph.addVertex(element: "Tokyo")
        let hongKong = graph.addVertex(element: "Hong Kong")
        let detroit = graph.addVertex(element: "Detroit")
        let sanFrancisco = graph.addVertex(element: "San Francisco")
        let washingtonDC = graph.addVertex(element: "Washington, D.C.")
        let austinTexas = graph.addVertex(element: "Austin")
        let seattle = graph.addVertex(element: "Seattle")
        
        for edge in [
            GraphEdge(source: singapore, destination: hongKong, weight: 300),
            GraphEdge(source: singapore, destination: tokyo, weight: 500),
            GraphEdge(source: hongKong, destination: tokyo, weight: 250),
            GraphEdge(source: tokyo, destination: detroit, weight: 450),
            GraphEdge(source: tokyo, destination: washingtonDC, weight: 300),
            GraphEdge(source: hongKong, destination: sanFrancisco, weight: 600),
            GraphEdge(source: detroit, destination: austinTexas, weight: 50),
            GraphEdge(source: austinTexas, destination: washingtonDC, weight: 292),
            GraphEdge(source: sanFrancisco, destination: washingtonDC, weight: 337),
            GraphEdge(source: washingtonDC, destination: seattle, weight: 277),
            GraphEdge(source: sanFrancisco, destination: seattle, weight: 218),
            GraphEdge(source: austinTexas, destination: sanFrancisco, weight: 297)
            ] {
                graph.addEdge(edge)
        }
        
        XCTAssertEqual(
            "\(graph)",
            """
        0: Singapore -> Tokyo (500.0)
                        Hong Kong (300.0)

        1: Tokyo -> Singapore (500.0)
                    Hong Kong (250.0)
                    Detroit (450.0)
                    Washington, D.C. (300.0)

        2: Hong Kong -> Singapore (300.0)
                        Tokyo (250.0)
                        San Francisco (600.0)

        3: Detroit -> Tokyo (450.0)
                      Austin (50.0)

        4: San Francisco -> Hong Kong (600.0)
                            Washington, D.C. (337.0)
                            Austin (297.0)
                            Seattle (218.0)

        5: Washington, D.C. -> Tokyo (300.0)
                               San Francisco (337.0)
                               Austin (292.0)
                               Seattle (277.0)

        6: Austin -> Detroit (50.0)
                     San Francisco (297.0)
                     Washington, D.C. (292.0)

        7: Seattle -> San Francisco (218.0)
                      Washington, D.C. (277.0)
        """
        )
    }
}

