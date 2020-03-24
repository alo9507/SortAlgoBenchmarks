//
//  SinglyLinkedListQueue.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

struct SinglyLinkedListQueue<Element>: Queue {
    private var head: LinkedListNode<Element>?
    private var tail: LinkedListNode<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peek: Element? {
        return head?.value
    }
    
    var count: Int {
        guard var node = head else { return 0 }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    mutating func enqueue(_ element: Element) {
        let node = LinkedListNode(element)
        
        if isEmpty {
            head = node
            tail = head
        } else {
            tail?.next = node
        }
    }
    
    
    mutating func dequeue() -> Element? {
        let oldHead = head
        head = head?.next
        if isEmpty { tail = head }
        return oldHead?.value
    }
    
}
