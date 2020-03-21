//
//  LinkedListStack.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

struct SinglyLinkedListStack<Element>: Stack {
    private var storage: LinkedList<Element>
    
    var isEmpty: Bool
    
    var count: Int
    
    func pop() -> Element? {
        let tail = storage.tail
        storage.tail = tail?.next
        return tail?.value
    }
    
    func push(_ element: Element) {
        let node: LinkedListNode<Element> = LinkedListNode(element)
        
    }
}
