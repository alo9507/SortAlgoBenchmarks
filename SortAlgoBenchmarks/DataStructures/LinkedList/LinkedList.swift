//
//  LinkedList.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/26/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class LinkedListNode<T>: Equatable {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init(_ value: T) {
        self.value = value
    }
    
    static func == (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        return lhs === rhs
    }
}

class LinkedList<T> {
    public var head: LinkedListNode<T>?
    public var tail: LinkedListNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public var first: LinkedListNode<T>? {
        return head
    }
    
    public var last: LinkedListNode<T>? {
        return tail
    }
    
    func append(_ value: T) {
        let node = LinkedListNode(value)
        
        if tail != nil {
            tail?.next = node
            node.previous = tail
        } else {
            head = node
        }
        
        tail = node
    }
    
    func reverse_singly() {
        print(self.description)
        var current: LinkedListNode<T>? = head
        var previous: LinkedListNode<T>?
        var next: LinkedListNode<T>?
        
        while current != nil {
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        
        head = previous
        print(self.description)
    }
    
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        
        return text + "]"
    }
}
