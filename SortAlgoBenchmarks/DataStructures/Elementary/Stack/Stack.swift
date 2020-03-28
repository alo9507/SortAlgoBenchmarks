//
//  Stack.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

protocol Stack: Sequence, IteratorProtocol {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var count: Int { get }
    var peek: Element? { get }
    
    mutating func pop() -> Element?
    mutating func push(_ element: Element)
}

extension Stack {
    mutating func next() -> Element? {
        return pop()
    }
}
