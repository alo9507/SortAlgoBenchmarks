//
//  HashTable.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/22/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// Hash Function: Preferred for short keys and no need for ordered operations
// Equality test: method for checking if two keys are equal
// Collision resolution: Algorithm and DS to handle two keys that hash to the same array index

// Classic space time trade off:
// No Space Limitation: Trivial Hash function with key as index
// No time limitation: trivial collision resolution with sequential search
// Space and time limitation: hashing

class SeparateChainingHashTableNode<Key: Hashable, Value> {
    var key: Key
    var value: Value
    var next: SeparateChainingHashTableNode<Key, Value>?
    
    init(_ key: Key, _ value: Value, _ next: SeparateChainingHashTableNode<Key, Value>?) {
        self.key = key
        self.value = value
        self.next = next
    }
}

// Doesn't support ordered operations
// Every type of key needs a hash function and you need a different hash function for each key type
struct SeparateChainingHashTable<Key: Hashable, Value>: HashTable {
    
    // M too small: chains too long
    // M too large: too many empty chains
    // use array resizing to ensure M ~ N / 5 constant-time ops
    var M = 97 // number of chains
    var storage: [SeparateChainingHashTableNode<Key, Value>?]
    // Universal hash functions: all keys are equally likely
    
    init() {
        storage = Array<SeparateChainingHashTableNode<Key, Value>?>(repeating: nil, count: M)
    }
    
    // Hash code: An int between -2^31 and 2^31 -1
    // Hash function: An int between 0 and M - 1 (M is typically a prime or power of 2) (for use as array index)
    // Uniform hashing assumption: each key is equally likely to hash to an integer between 0 and M - 1 (bins and balls and Birthday Problem from Combinatorial Analysis)
    
    /// Scramble keys uniformly to produce a table index
    /// Must be efficient and each table index must be equally likely for each key
    /// Ideally you want to invlove all the bits/chars in your input
}

extension SeparateChainingHashTable {
    // Separate Chaining
    // Can't avoid collisions unless you have a quadratic amount of memory
    
    /// Map Key to integer i between 0 and M  - 1
    /// - Parameter key: A key
    func hash(_ key: Key) -> Int {
        return abs(key.hashValue % M)
    }
    
    func get(_ key: Key) -> Value? {
        let i = hash(key)
        var current = storage[i]
        while current != nil {
            if current?.key == key { return current?.value }
            current = current?.next
        }
        return nil
    }
    
    /// Put at front of ith chain (if not already there)
    /// - Parameters:
    ///   - key: key
    ///   - element: value
    mutating func insert(_ key: Key, _ value: Value) {
        let i = hash(key)
        var current = storage[i]
        while current != nil {
            if current?.key == key { current?.value = value; return  }
            current = current?.next
        }
        storage[i] = SeparateChainingHashTableNode(key, value, nil)
    }
    
    /// Need to search only ith chain
    /// - Parameter key: key
    func search(_ key: Key) -> Bool {
        return false
    }
}
