//
//  LinearProbingHashTable.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 4/4/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// Use an array. When a new key collides, proceed forward to empty slot and put it there
// Array must be bigger than the number of keys we expect

// "Clusters" is an ambiguous block of items
// Observation: new keys are liekly to hash into middle of big clusters
// ARRAY SIZE M MUST BE GREATER THAN NUMBER OF KEY/VALUE-PAIRS N
// For resizing, it's ideal for it to remain at least half empty

// Knuth's parking problem: statistical analysis to make provable statements about performance of this algo
class LinearProbingHashTable<Key: Hashable, Value>: HashTable {
    var M = 97
    var keys: [Key?]
    var values: [Value?]
    
    init() {
        keys = Array<Key?>(repeating: nil, count: M)
        values = Array<Value?>(repeating: nil, count: M)
    }
    
    func hash(_ key: Key) -> Int {
        return abs(key.hashValue) % M
    }
    
    func get(_ key: Key) -> Value? {
        var i = hash(key)
        while keys[i] != key {
            i += 1
        }
        return values[i]
    }
    
    func insert(_ key: Key, _ value: Value) {
        var i = hash(key)
        while keys[i] != nil {
            i += 1
        }
        keys[i] = key
        values[i] = value
    }
    
    func search(_ key: Key) -> Bool {
        // probe forward until reaching an empty position
        return false
    }
}
