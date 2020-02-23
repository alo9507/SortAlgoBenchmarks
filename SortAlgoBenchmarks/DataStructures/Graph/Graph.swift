//
//  Graph.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/17/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

protocol Graph {
    associatedtype Element
    
    typealias Edge = GraphEdge<Element>
    typealias Vertex = Edge.Vertex
    
    var vertices: [Vertex] { get }
    
    // returns a Vertex with a populated index
    @discardableResult
    mutating func addVertex(_ : Element) -> Vertex
    
    // returns all edges with a given vertex as their source
    func getEdges(from: Vertex) -> [Edge]
}

struct GraphVertex<Element> {
    let index: Int
    let element: Element
}

// With two GraphVertex you can define a GraphEdge
struct GraphEdge<Element> {
    // An edge's vertices will be a GraphVertex with a matching Element type
    typealias Vertex = GraphVertex<Element>
    
    let source: Vertex
    let destination: Vertex
    let weight: Double
}

extension Graph where Element: Hashable {
    func getPaths(from source: Vertex, to destination: Vertex) -> Set<[Edge]> {
        var completedPaths: Set<[Edge]> = []
        
        // edges connected to the source vertex
        var activePaths = Set( getEdges(from: source).map { [$0] } )
        
        // until activePaths is empty, we loop over all of its edge arrays
        while !activePaths.isEmpty {
            for path in activePaths {
                //if we find an edge in the path ending at the destination, we add the path to our completedPaths
                let pathEnd = path.last!.destination
                
                // regardless of whether the path was:
                // A) complete
                // B) got added to
                // C) didn't end up leading to the destination
                // We remove it from the active paths
                defer { activePaths.remove(path) }
                
                if pathEnd == destination {
                    completedPaths.insert(path)
                    
                    // ends execution of the current iteration of a loop statement
                    continue
                }
                // otherwise we get all the edges from the path end whos edges weren't already in the path
                getEdges(from: pathEnd)
                    // filter on
                    .filter {
                        !path.map { $0.source } .contains($0.destination)
                }
                .forEach { activePaths.insert(path + [$0]) }
            }
        }
        
        return completedPaths
    }
}

// To add edges to a PriorityQueue, they'll have to be Equatable
extension GraphEdge: Equatable where Element: Equatable {}
extension GraphEdge: Hashable where Element: Hashable {}

// In order to be used as a dictionary key, GraphVertex must be Hashable
extension GraphVertex: Hashable where Element: Hashable {}

// Conditional conformance to Hashable does not imply conformance to inherited protocol Equatable
extension GraphVertex: Equatable where Element: Equatable {}
