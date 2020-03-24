//
//  OrderedArrayPriorityQueue.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// Insert: O(N)
// Del Max: O(1)
// Max: O(1)
struct OrderedArrayPriorityQueue<Element: Comparable>: Queue {
    private var storage: [Element] = []
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var peek: Element?
    
    var count: Int
    
    mutating func enqueue(_ element: Element) {
        storage.append(element)
    }
    
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        
        var maxIndex: Int = 0
        for i in stride(from: 1, to: storage.count, by: 1) {
            if storage[i] > storage[maxIndex] {
                maxIndex = i
            }
        }
        return storage[maxIndex]
    }
}

