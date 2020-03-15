//
//  Trie.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// Use a prefix tree when you want to take a partial value and return a list of possible complete values
// You can think of a trie as a set of related values, and what they have in common is their prefix
// Eg. searching for the prefix "b" will return all values from root to leaf that represent complete words
// Eg. searching for the prefix "be" will return fewer, more specific values

// Fun fact: "trie" is an infix of the word "re-'trie'-val"

class TrieNode<T: Hashable> {
    var value: T? // the value must be hashable because it's used as a key in the children dictionary
    weak var parent: TrieNode? // necessary for remove operations
    var children: [T: TrieNode] = [:]
    var isTerminating = false
    
    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: T) {
        guard children[child] == nil else { return } // this preserves uniqueness of all children
        children[child] = TrieNode(value: child, parent: self)
    }
}

class Trie {
    typealias Node = TrieNode<Character>
    
    fileprivate let root: Node
    
    init() {
        root = Node()
    }
}

extension Trie {
    // a trie always tries to reuse existing nodes to complete a sequence
    // e.g. "cut" and "cute" could be represented with 4 nodes
    func insert(word: String) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
        
        let characters = Array(word.lowercased())
        var currentIndex = 0
        
        while currentIndex < characters.count {
            let character = characters[currentIndex]
            
            // if the first character is already there, step to it
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
            // otherwise, add this character as a child and THEN step to it
                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }
            
            currentIndex += 1
        }
        if currentIndex == characters.count { currentNode.isTerminating = true }
    }
    
    func contains(word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var currentNode = root
        
        let characters = Array(word.lowercased())
        var currentIndex = 0
        
        while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
            currentNode = child
            currentIndex += 1
        }
        
        return currentIndex == characters.count && currentNode.isTerminating
    }
}
