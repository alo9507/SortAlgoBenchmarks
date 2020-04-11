//
//  TopologicalSortTest.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class TopologicalSortTest: XCTestCase {
    let graph: AdjacencyList<String> = {
        var graph = AdjacencyList<String>()
        
        let linkingObject = graph.addVertex(element: "Linking Objects")
        let tree = graph.addVertex(element: "Tree")
        let al = graph.addVertex(element: "Graph")
        let ll = graph.addVertex(element: "Linked List")
        let dfs = graph.addVertex(element: "Depth First Search")
        let stack = graph.addVertex(element: "Stack")
        let ts = graph.addVertex(element: "Topological Sort")
        
        let linkingObject_tree = GraphEdge(source: linkingObject, destination: tree)
        let linkingObject_graph = GraphEdge(source: linkingObject, destination: al)
        let linkingObject_ll = GraphEdge(source: linkingObject, destination: ll)
        
        let tree_dfs = GraphEdge(source: tree, destination: dfs)
        let al_dfs = GraphEdge(source: al, destination: dfs)
        
        let dfs_ts = GraphEdge(source: dfs, destination: ts)
        
        let stack_ts = GraphEdge(source: stack, destination: ts)
        
        for edge in [linkingObject_tree, linkingObject_graph, linkingObject_ll, tree_dfs, al_dfs, dfs_ts, stack_ts] {
            graph.addEdge(edge, directed: true)
        }
        
        return graph
    }()
    
    func test_calculateInDegrees() {
        let inDegrees = StandardTopologicalSort.calculateInDegreeOfNodes(in: graph)
        
        let stack = graph.vertices.filter { $0.element == "Stack" }.first!
        let topologicalSort = graph.vertices.filter { $0.element == "Topological Sort" }.first!
        let linkingObjects = graph.vertices.filter { $0.element == "Linking Objects" }.first!
        let tree = graph.vertices.filter { $0.element == "Tree" }.first!
        let graphType = graph.vertices.filter { $0.element == "Graph" }.first!
        let ll = graph.vertices.filter { $0.element == "Linked List" }.first!
        let dfs = graph.vertices.filter { $0.element == "Depth First Search" }.first!
        
        XCTAssertEqual(0, inDegrees[linkingObjects])
        XCTAssertEqual(1, inDegrees[tree])
        XCTAssertEqual(1, inDegrees[graphType])
        XCTAssertEqual(1, inDegrees[ll])
        XCTAssertEqual(2, inDegrees[dfs])
        XCTAssertEqual(2, inDegrees[topologicalSort])
        XCTAssertEqual(0, inDegrees[stack])
    }
    
    func test_standardTopologicalSort() {
        StandardTopologicalSort.topsort(graph: graph).forEach { (vertex) in
            print(vertex.element)
        }
    }
    
    func test_kahnsTopologicalSort() {
        KahnsTopologicalSort.topsort(for: graph).forEach { (vertex) in
            print(vertex.element)
        }
    }
}

