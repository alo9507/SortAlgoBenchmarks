//
//  Bag.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// A bag is a counted set, i.e. can contain duplicated items with their frequencies
class LinkedListBag<Element: Hashable> {
    private var head: LinkedListNode<Element>?
    private var tail: LinkedListNode<Element>?
    private var count: Int = 0
    
    func add(_ element: Element) {
        let node = LinkedListNode(element)
        
        if tail != nil {
            tail?.next = node
        } else {
            head = node
            tail = node
        }
        
        count += 1
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func contains(_ element: Element) -> Bool {
        var current = head
        while current != nil {
            if current?.value == element { return true }
            current = current?.next
        }
        return false
    }
    
    var size: Int {
        return count
    }
}

extension LinkedListBag: Sequence, IteratorProtocol {
    func next() -> Element? {
        return head?.value
    }
}
