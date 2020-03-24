//
//  PriorityQueue.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// Can implement with a sorted array, balanced binary search tree, or heap
// Basically a simpler focused interface for your hep
struct PriorityQueue<Element: Equatable>: Queue {
    private var heap: Heap<Element>
    
    init(_ elements: [Element] = [], areSorted: @escaping (Element, Element) -> Bool) {
        // easy to conform to QueueProtocol
        heap = Heap(elements, areSorted: areSorted)
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var peek: Element? {
        return heap.peek()
    }
    
    var count: Int {
        return heap.count
    }
    
    mutating func enqueue(_ element: Element) {
        heap.push(element)
    }
    
    mutating func dequeue() -> Element? {
        heap.pop()
    }
}
