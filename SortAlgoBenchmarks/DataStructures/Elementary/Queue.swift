//
//  Queue.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

protocol Queue: Sequence, IteratorProtocol {
    associatedtype Element
    var isEmpty: Bool { get }
    var peek: Element? { get }
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
}

extension Queue {
    mutating func next() -> Element? {
        return dequeue()
    }
}

struct ArrayQueue<Element>: Queue {
    private var storage: [Element] = []
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var peek: Element? {
        return storage.first
    }
    
    mutating func enqueue(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : storage.removeFirst()
    }
}

extension ArrayQueue: CustomStringConvertible {
    var description: String {
        return storage
            .map { "\($0)" }
            .joined(separator: " ")
    }
}
