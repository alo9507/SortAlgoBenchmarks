//
//  BinaryTree.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// The enum now holds references to it’s associated values, rather than their value. References have a constant size
enum BinaryTree<T> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
}

/// Each node can have at most two child nodes
class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Element) {
        self.value = value
    }
}

// Tree Traversal Methods

// Depth-first traversal explores one branch in it's entirety before backtracking
// Level-order/Breadth-first traversal explores each level

// Preorder: Visit current, then recurse down all left children, then recurse down all right children
// Inorder: Recurse down all left children, then visit current, then recurse down all right children
// Traverse all the way down left branch, then visit nodes on the ascent

// Postorder: Recurse down all left children, then recurse down all right children, and visit current last
extension BinaryNode {
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

extension BinaryNode: CustomStringConvertible {
    //Note: This algorithm is based on an implementation by Károly Lőrentey in his book Optimizing Collections, available from https://www.objc.io/books/optimizing-collections/.
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild,
                       top + " ", top + "┌──", top + "│ ")
            + root + "\(node.value)\n"
            + diagram(for: node.leftChild,
                      bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

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

