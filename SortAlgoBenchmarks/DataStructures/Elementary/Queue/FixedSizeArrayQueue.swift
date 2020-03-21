//
//  FixedSizeArrayQueue.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

struct FixedSizeArrayQueue<Element>: Queue {
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
        
    }
    
    func dequeue() -> Element? {
        return nil
    }
    
}
