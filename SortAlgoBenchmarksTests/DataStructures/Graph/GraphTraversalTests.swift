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
    func test_graphDFS() {
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
        
        let x = graph.addVertex(element: "X")
        let y = graph.addVertex(element: "Y")
        
        let j = graph.addVertex(element: "J")
        
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
                        graph.addEdge(edge)
        }
        
        graph.depthFirstSearch(a)
        
        print("\n\n\n")
        
        IterativeGraphDFS.depthFirstSearch(graph: graph, a)
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
