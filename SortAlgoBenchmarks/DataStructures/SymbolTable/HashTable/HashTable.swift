//
//  HashTable.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 4/4/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/*
 Algorithmic Complexity Attacks: Adversarial input can ruin your DS's. Harder to do when you have "performance guarantees" for lower bounds, e.g. Red-Black Trees
 (Run a test to show an algorithmic complexity attack slowdown)
 One-way hash functions are too expensive for use in Symbol Table implementations
 Cost of computing a hash function for a given key may exceed the cost of searching
 */

protocol HashTable {
    associatedtype Key: Hashable
    associatedtype Value
    
    func hash(_ key: Key) -> Int
    func get(_ key: Key) -> Value?
    func search(_ key: Key) -> Bool
    mutating func insert(_ key: Key, _ value: Value)
}
