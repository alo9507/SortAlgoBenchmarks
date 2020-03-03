//
//  GraphVertex.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/3/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

struct GraphVertex<Element> {
    let index: Int
    let element: Element
}

// In order to be used as a dictionary key, GraphVertex must be Hashable
extension GraphVertex: Hashable where Element: Hashable {}

// Conditional conformance to Hashable does not imply conformance to inherited protocol Equatable
extension GraphVertex: Equatable where Element: Equatable {}
