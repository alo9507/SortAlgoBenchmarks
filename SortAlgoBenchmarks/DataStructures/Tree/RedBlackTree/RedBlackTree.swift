//
//  RedBlackTree.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/17/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

private enum RBTreeColor {
    case red
    case black
}

private enum RotationDirection {
    case left
    case right
}

public class RBTreeNode<T: Comparable>: Equatable {
    public typealias RBNode = RBTreeNode<T>
    
    fileprivate var color: RBTreeColor = .black
    fileprivate var key: T?
    var leftChild: RBNode?
    var rightChild: RBNode?
    fileprivate weak var parent: RBNode?
    
    public init(key: T?, leftChild: RBNode?, rightChild: RBNode?, parent: RBNode?) {
        self.key = key
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
        
        self.leftChild?.parent = self
        self.rightChild?.parent = self
    }
    
    public convenience init(key: T?) {
        self.init(key: key, leftChild: RBNode(), rightChild: RBNode(), parent: RBNode())
    }
    
    public convenience init() {
        self.init(key: nil, leftChild: nil, rightChild: nil, parent: nil)
        self.color = .black
    }
    
    public func getKey() -> T? {
        return key
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return rightChild == nil && leftChild == nil
    }
    
    var isNullLeaf: Bool {
        return key == nil && leftChild == nil && rightChild == nil
    }
    
    var isLeftChild: Bool {
        return self.parent?.leftChild == self
    }
    
    var isRightChild: Bool {
        return self.parent?.rightChild == self
    }
    
    var grandparent: RBNode? {
        return self.parent?.parent
    }
    
    var sibling: RBNode? {
        if isLeftChild {
            return self.parent?.rightChild
        } else {
            return self.parent?.leftChild
        }
    }
    
    var uncle: RBNode? {
        return parent?.sibling
    }
}

extension RBTreeNode {
    static public func == <T>(lhs: RBTreeNode<T>, rhs: RBTreeNode<T>) -> Bool {
        return lhs.key == rhs.key
    }
}

public class RedBlackTree<T: Comparable> {
    public typealias RBNode = RBTreeNode<T>
    
    fileprivate(set) var root: RBNode
    fileprivate(set) var size = 0
    fileprivate let nullLeaf = RBNode()
    
    public init() {
        root = nullLeaf
    }
}

extension RedBlackTree {
    public func insert(key: T) {
        if root.isNullLeaf {
            root = RBNode(key: key)
        } else {
            insert(input: RBNode(key: key), node: root)
        }
        size += 1
    }
    
    private func insert(input: RBNode, node: RBNode) {
        guard let inputKey = input.key, let nodeKey = node.key else {
            return
        }
        if inputKey < nodeKey {
            guard let child = node.leftChild else {
                addAsLeftChild(child: input, parent: node)
                return
            }
            if child.isNullLeaf {
                addAsLeftChild(child: input, parent: node)
            } else {
                insert(input: input, node: child)
            }
        } else {
            guard let child = node.rightChild else {
                addAsRightChild(child: input, parent: node)
                return
            }
            if child.isNullLeaf {
                addAsRightChild(child: input, parent: node)
            } else {
                insert(input: input, node: child)
            }
        }
    }
    
    private func addAsLeftChild(child: RBNode, parent: RBNode) {
        parent.leftChild = child
        child.parent = parent
        child.color = .red
        insertFixup(node: child)
    }
    
    private func addAsRightChild(child: RBNode, parent: RBNode) {
        parent.rightChild = child
        child.parent = parent
        child.color = .red
        insertFixup(node: child)
    }
    
    private func insertFixup(node z: RBNode) {
        
    }
}
