//
//  TrieSymbolTable.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/22/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class TrieSymbolTable<Value: Hashable>: HashTable {
    typealias Key = String
    typealias Value = Value
    
    let R = 256 // extended ASCII
    
    var trie = Trie<Value>()
    
    func insert(_ key: String, _ value: Value) {
        trie.insert(word: key, value)
    }
    
    func hash(_ key: String) -> Int {
        return 0
    }
    
    func get(_ key: String) -> Value? {
        return trie.get(word: key)?.dictValue
    }
    
    func search(_ key: String) -> Bool {
        return false
    }
}
