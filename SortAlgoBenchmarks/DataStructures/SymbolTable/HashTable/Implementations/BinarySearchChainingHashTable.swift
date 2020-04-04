//
//  BinarySearchChainingHashTable.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 4/4/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class BinarySearchHashTableNode<Key: Hashable & Comparable, Value> {
    var key: Key
    var value: Value
    var leftChild: BinarySearchHashTableNode<Key, Value>?
    var rightChild: BinarySearchHashTableNode<Key, Value>?
    
    init(_ key: Key,
         _ value: Value,
         leftChild: BinarySearchHashTableNode? = nil,
         rightChild: BinarySearchHashTableNode? = nil) {
        self.key = key
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    func insert(_ node: BinarySearchHashTableNode<Key, Value>) {
        if node.key > self.key {
            if self.rightChild != nil {
                self.rightChild = node; return
            } else {
                self.rightChild?.insert(node)
            }
        }
        
        if node.key <= self.key {
            if self.leftChild == nil {
                self.leftChild = node; return
            } else {
                self.leftChild?.insert(node)
            }
        }
    }
    
    func get(_ key: Key) -> Value? {
        if key > self.key {
            return self.rightChild?.get(key)
        } else if key < self.key {
            return self.leftChild?.get(key)
        } else {
            return self.value
        }
    }
}

class BinarySearchChainingHashTable<Key: Hashable & Comparable, Value>: HashTable {
    var storage: BinarySearchHashTableNode<Key, Value>?
    
    init() {}
    
    func hash(_ key: Key) -> Int {
        return 0
    }
    
    func get(_ key: Key) -> Value? {
        return storage?.get(key)
    }
    
    func search(_ key: Key) -> Bool {
        return false
    }
    
    func insert(_ key: Key, _ value: Value) {
        let newNode = BinarySearchHashTableNode(key, value)
        if storage == nil { storage = newNode }
        storage?.insert(newNode)
    }
}
