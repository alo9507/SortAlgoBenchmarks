//
//  Trie.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class TrieNode<T: Hashable> {
    var value: T?
    weak var parentNode: TrieNode?
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
    init(_ value: T? = nil, parentNode: TrieNode? = nil) {
        self.value = value
        self.parentNode = parentNode
    }
    
    func add(_ value: T) {
        guard children[value] == nil else {
            return
        }
        children[value] = TrieNode(value, parentNode: self)
    }
}

class Trie {
    typealias Node = TrieNode<Character>
    
    let wordCount: Int
    let root: Node
    
    init() {
        root = Node()
        wordCount = 0
    }
    
    public var count: Int {
        return wordCount
    }
    
    public var isEmpty: Bool {
        return wordCount == 0
    }
}

extension Trie {
    func insert(word: String) {
        guard !word.isEmpty else { return }
        
        var currentNode = root
    }
}
