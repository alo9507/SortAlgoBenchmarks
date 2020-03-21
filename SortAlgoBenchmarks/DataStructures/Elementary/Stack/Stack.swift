//
//  Stack.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

protocol Stack {
    associatedtype Element
    var isEmpty: Bool { get }
    var count: Int { get }
    
    mutating func pop() -> Element?
    mutating func push(_ element: Element)
}
