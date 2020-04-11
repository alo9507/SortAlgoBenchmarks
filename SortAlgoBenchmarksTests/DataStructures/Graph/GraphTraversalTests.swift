//
//  GraphDFSTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class GraphTraversalTests: XCTestCase {
    var dag: AdjacencyList<String> {
        var dag = AdjacencyList<String>()
        
        let a = dag.addVertex(element: "A")
        let b = dag.addVertex(element: "B")
        let c = dag.addVertex(element: "C")
        let d = dag.addVertex(element: "D")
        let e = dag.addVertex(element: "E")
        let f = dag.addVertex(element: "F")
        let g = dag.addVertex(element: "G")
        let h = dag.addVertex(element: "H")
        let i = dag.addVertex(element: "I")
        
        let x = dag.addVertex(element: "X")
        let y = dag.addVertex(element: "Y")
        
        let j = dag.addVertex(element: "J")
        
        let ab = GraphEdge(source: a, destination: b, weight: 0)
        let af = GraphEdge(source: a, destination: f, weight: 0)
        
        let bc = GraphEdge(source: b, destination: c, weight: 0)
        let bd = GraphEdge(source: b, destination: d, weight: 0)
        let be = GraphEdge(source: b, destination: e, weight: 0)
        
        let fg = GraphEdge(source: f, destination: g, weight: 0)
        let fh = GraphEdge(source: f, destination: h, weight: 0)
        let fi = GraphEdge(source: f, destination: i, weight: 0)
        
        let cx = GraphEdge(source: c, destination: x, weight: 0)
        let dx = GraphEdge(source: d, destination: x, weight: 0)
        let ex = GraphEdge(source: e, destination: x, weight: 0)
        
        let gy = GraphEdge(source: g, destination: y, weight: 0)
        let hy = GraphEdge(source: h, destination: y, weight: 0)
        let iy = GraphEdge(source: i, destination: y, weight: 0)
        
        let xj = GraphEdge(source: x, destination: j, weight: 0)
        let yj = GraphEdge(source: y, destination: j, weight: 0)
        
        for edge in [ab,af,bc,bd,be,fg,fh,fi,cx,dx,ex,gy,hy,iy,xj,yj] {
            dag.addEdge(edge, directed: true)
        }
        
        return dag
    }
    
    func test_recursiveDepthFirstSearch() {
        let a = dag.vertices.filter { $0.element == "A" }.first!
        let result = RecursiveGraphDFS.depthFirstSearch(for: dag, from: a).vertices
        print("RecursiveDFS: \(result)")
        XCTAssertEqual("A B C X J D E F G Y H I", result)
    }
    
    func test_iterativeDepthFirstSearch() {
        let a = dag.vertices.filter { $0.element == "A" }.first!
        let result = IterativeGraphDFS.depthFirstSearch(for: dag, from: a).vertices
        XCTAssertEqual("A F I Y J H G B E X D C", result)
    }
    
    func test_bfs() {
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
        
        graph.breadthFirstSearch(graph.vertices.first!) { element in
            print(element)
        }
    }
    
    func test_findComponents() {
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
        
    }
}

extension Array where Element == GraphVertex<String> {
    var vertices: String {
        return self
            .map { "\($0.element)" }
            .joined(separator: " ")
    }
}
