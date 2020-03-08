//
//  LinkedList.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/26/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class Node<T>: Equatable {
    var value: T
    var next: Node?
    weak var previous: Node?
    
    init(_ value: T) {
        self.value = value
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs === rhs
    }
}

class LinkedList<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    func append(_ value: T) {
        let node = Node(value)
        
        if tail != nil {
            tail?.next = node
            node.previous = tail
        } else {
            head = node
        }
        
        tail = node
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
