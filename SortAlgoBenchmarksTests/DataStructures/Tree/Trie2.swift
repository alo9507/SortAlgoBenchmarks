//
//  Trie2.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 4/4/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class TrieNode2<T: Hashable> {
    var value: T?
    var children: [T: TrieNode2] = [:]
    var isTerminating = false
    var isLeaf: Bool {
        return children.count == 0
    }
    
    init(value: T? = nil) {
        self.value = value
    }
    
    func add(value: T) {
        guard children[value] == nil else {
            return
        }
        children[value] = TrieNode2(value: value)
    }
}

class Trie2 {
    typealias Node = TrieNode2<Character>
    
    fileprivate let root: Node
    
    init() {
        root = Node()
    }
}

extension Trie2 {
    func insert(word: String) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
        
        for character in word.lowercased() {
            if let childNode = currentNode.children[character] {
                currentNode = childNode
            } else {
                currentNode.add(value: character)
                currentNode = currentNode.children[character]!
            }
        }
        
        guard !currentNode.isTerminating else {
            return
        }
        
        currentNode.isTerminating = true
    }
    
    func contains(word: String) -> Bool {
        guard !word.isEmpty else {
            return false
        }
        var currentNode = root
        for character in word.lowercased() {
            guard let childNode = currentNode.children[character] else {
                return false
            }
            currentNode = childNode
        }
        return currentNode.isTerminating
    }
}
