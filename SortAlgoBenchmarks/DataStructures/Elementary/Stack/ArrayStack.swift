//
//  Stack.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/23/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

struct ArrayStack<Element>: Sequence, IteratorProtocol {
    private var storage: [Element] = []
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var peek: Element? {
        return storage.last
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return isEmpty ? nil : storage.removeLast()
    }
    
    var count: Int {
        return storage.count
    }
}

extension ArrayStack {
    mutating func next() -> Element? {
        return pop()
    }
}

extension ArrayStack: CustomStringConvertible {
    var description: String {
        return storage
            .map { "\($0)" }
            .joined(separator: " ")
    }
}
