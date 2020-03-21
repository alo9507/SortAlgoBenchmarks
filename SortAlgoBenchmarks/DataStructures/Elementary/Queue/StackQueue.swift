//
//  StackQueue.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

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
