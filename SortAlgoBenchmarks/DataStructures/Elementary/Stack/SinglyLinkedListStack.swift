//
//  LinkedListStack.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// Push: Omega(1) / O(1)
// Pop: Omega(1) / O(1)
// Count: O(N)
// Space: O(N)
struct SinglyLinkedListStack<Element: Equatable>: Stack {
    private var storage: SinglyLinkedList<Element> = SinglyLinkedList<Element>()
    
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var count: Int {
        return storage.count
    }
    
    var peek: Element? {
        return nil
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        let head = storage.head
        storage.head = head?.next
        return head?.value
    }
    
    mutating func push(_ element: Element) {
        let node = LinkedListNode(element)
        node.next = storage.head
        storage.head = node
    }
}
