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
    var count: Int { get }
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
    
    var count: Int {
        return storage.count
    }
    
    mutating func enqueue(_ element: Element) {
        storage.append(element)
    }
    
    // O(n) to dequeue
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

// Enqueue: O(N)
// Dequeue: O(1)

// Useful when there will be many enqueue operations in a row, and then many dequeue operations in a row

struct StackQueue<Element>: Queue {
    private var enqueueStack: [Element] = []
    private var dequeueStack: [Element] = []
    
    var isEmpty: Bool
    
    var peek: Element? {
        dequeueStack.isEmpty ? enqueueStack.first : dequeueStack.last
    }
    
    var count: Int {
        return enqueueStack.count + dequeueStack.count
    }
    
    mutating func enqueue(_ element: Element) {
        enqueueStack.append(element)
    }
    
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.removeLast()
    }
}
