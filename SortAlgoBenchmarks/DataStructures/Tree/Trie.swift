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

// Symbol table specialized to string types
//
//  Trie.swift
//  Trie
//
//  Created by Rick Zaccone on 2016-12-12.
//  Copyright © 2016 Rick Zaccone. All rights reserved.
//

import Foundation

/// A node in the trie
class TrieNode<T: Hashable> {
    var value: T?
    var children: [T: TrieNode] = [:]
    var isTerminating = false
    var isLeaf: Bool {
        return children.count == 0
    }
    
    /// Initializes a node.
    ///
    /// - Parameters:
    ///   - value: The value that goes into the node
    ///   - parentNode: A reference to this node's parent
    init(value: T? = nil) {
        self.value = value
    }
    
    /// Adds a child node to self.  If the child is already present,
    /// do nothing.
    ///
    /// - Parameter value: The item to be added to this node.
    func add(value: T) {
        guard children[value] == nil else {
            return
        }
        children[value] = TrieNode(value: value)
    }
}

/// A trie data structure containing words.  Each node is a single
/// character of a word.
class Trie {
    typealias Node = TrieNode<Character>
    
    fileprivate let root: Node
    
    /// Creates an empty trie.
    init() {
        root = Node()
    }
}

// MARK: - Adds methods: insert, remove, contains
extension Trie {
    /// Inserts a word into the trie.  If the word is already present,
    /// there is no change.
    ///
    /// - Parameter word: the word to be inserted.
    func insert(word: String) {
        guard !word.isEmpty else {
            return
        }
        var currentNode = root
        for character in word.lowercased() {
            if let childNode = currentNode.children[character] {
                currentNode = childNode
            } else {
                currentNode.add(value: character)
                currentNode = currentNode.children[character]!
            }
        }
        // Word already present?
        guard !currentNode.isTerminating else {
            return
        }
        currentNode.isTerminating = true
    }
    
    /// Determines whether a word is in the trie.
    ///
    /// - Parameter word: the word to check for
    /// - Returns: true if the word is present, false otherwise.
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
