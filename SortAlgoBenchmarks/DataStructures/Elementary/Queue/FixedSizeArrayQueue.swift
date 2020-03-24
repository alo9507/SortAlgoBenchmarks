//
//  FixedSizeArrayQueue.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

struct FixedSizeArrayQueue<Element>: Queue {
    private var storage = [Element?](repeating: nil, count: 10)
    
    var head: Int = 0
    
    // like size in stack
    var tail: Int = 0
    
    var isEmpty: Bool {
        return true
    }
    
    var peek: Element? {
        return nil
    }
    
    var count: Int {
        return 0
    }
    
    func enqueue(_ element: Element) {
        // enqueue at tail
    }
    
    func dequeue() -> Element? {
        // dequeue at head
        return nil
    }
    
}
