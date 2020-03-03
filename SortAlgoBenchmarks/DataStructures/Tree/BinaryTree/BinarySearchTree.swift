//
//  BinarySearchTree.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/3/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// A binary search tree is a special kind of binary tree (a tree in which each node has at most two children) that performs insertions and deletions such that the tree is always sorted.
class BinarySearchTree<T: Comparable> {
    var value: T
    var leftChild: BinarySearchTree?
    var rightChild: BinarySearchTree?
    
    init(value: T, leftChild: BinarySearchTree<T>? = nil, rightChild: BinarySearchTree<T>? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    var count: Int {
        return (leftChild?.count ?? 0) + 1 + (rightChild?.count ?? 0)
    }
    
//    O(h) time where h is the height of the tree
    func insert(_ element: T) {
        let node = BinarySearchTree(value: element)
        
        if element > self.value {
            if self.rightChild == nil {
                return self.rightChild = node
            } else {
                self.rightChild?.insert(element)
            }
        }
        
        if element <= self.value {
            if self.leftChild == nil {
                return self.leftChild = node
            } else {
                self.leftChild?.insert(element)
            }
        }
    }
    
    // O (log n)
    func search(_ element: T) -> BinarySearchTree? {
        if element < value {
            return leftChild?.search(value)
        } else if element > value {
            return rightChild?.search(value)
        } else {
            return self
        }
    }
    
    func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.leftChild {
            node = next
        }
        return node
    }
    
    func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.rightChild {
            node = next
        }
        return node
    }
    
    var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
    
    // height of a tree
    // distance to lowest leaf
    // recursively looks at the heights of the left and right and returns the highest one
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
        }
    }
    
    // depth of a node, i.e. distance from root
    
}


