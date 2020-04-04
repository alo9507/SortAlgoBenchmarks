//
//  BinarySearchNode.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/3/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// A binary search tree is a special kind of binary tree (a tree in which each node has at most two children) that performs insertions and deletions such that the tree is always sorted.

class BinarySearchNode<T: Comparable> {
    var value: T
    var parent: BinarySearchNode?
    var leftChild: BinarySearchNode?
    var rightChild: BinarySearchNode?
    
    init(_ value: T,
         parent: BinarySearchNode<T>? = nil,
         leftChild: BinarySearchNode<T>? = nil,
         rightChild: BinarySearchNode<T>? = nil
    ) {
        self.value = value
        self.parent = parent
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    var count: Int {
        return (leftChild?.count ?? 0) + 1 + (rightChild?.count ?? 0)
    }
    
    //    O(h) time where h is the height of the tree
    func insert(_ element: T) {
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.insert(value)
            } else {
                leftChild = BinarySearchNode(value)
                leftChild?.parent = self
            }
        } else {
            if let rightChild = rightChild {
                rightChild.insert(value)
            } else {
                rightChild = BinarySearchNode(value)
                rightChild?.parent = self
            }
        }
    }
    
    // we replace the node either with its biggest child on the left, or its smallest child on the right
    func remove() -> BinarySearchNode? {
        let replacement: BinarySearchNode?
        
        if let rightChild = self.rightChild {
            replacement = rightChild.minimum()
        } else if let leftChild = self.leftChild {
            replacement = leftChild.maximum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        replacement?.rightChild = rightChild
        replacement?.leftChild = leftChild
        rightChild?.parent = replacement
        leftChild?.parent = replacement
        reconnectParentTo(replacement)
        
        parent = nil
        leftChild = nil
        rightChild = nil
        
        return replacement
    }
    
    private func reconnectParentTo(_ node: BinarySearchNode?) {
        if let parent = parent {
            if isLeftChild {
                parent.leftChild = node
            } else {
                parent.rightChild = node
            }
        }
        node?.parent = parent
    }
    
    var isLeftChild: Bool {
        return parent?.leftChild == self
    }
    
    var isRightChild: Bool {
        return parent?.rightChild == self
    }
    
    // O (log n)
    func search(_ element: T) -> BinarySearchNode? {
        var node: BinarySearchNode? = self
        while let n = node {
            if value < n.value {
                node = n.leftChild
            } else if value > n.value {
                node = n.rightChild
            } else {
                return node
            }
        }
        return nil
    }
    
    func minimum() -> BinarySearchNode {
        var node = self
        while let next = node.leftChild {
            node = next
        }
        return node
    }
    
    func maximum() -> BinarySearchNode {
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
    
    public func rangeSearch(_ lowerBound: T, upperBound: T) -> Void {
        
    }
}

extension BinarySearchNode: Equatable {
    static func == (lhs: BinarySearchNode<T>, rhs: BinarySearchNode<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

extension BinarySearchNode: CustomStringConvertible {
    //Note: This algorithm is based on an implementation by Károly Lőrentey in his book Optimizing Collections, available from https://www.objc.io/books/optimizing-collections/.
    
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinarySearchNode?,
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
