//
//  AVLTree.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

public class AVLNode<Key: Comparable, Element> {
    public typealias Node = AVLNode<Key, Element>
    
    var value: Element?
    
    fileprivate var key: Key // nodes name
    internal var leftChild: Node?
    internal var rightChild: Node?
    fileprivate var height: Int
    weak fileprivate var parent: Node?
    
    public init(key: Key, value: Element?, leftChild: Node?, rightChild: Node?, parent: Node?, height: Int) {
      self.key = key
      self.value = value
      self.leftChild = leftChild
      self.rightChild = rightChild
      self.parent = parent
      self.height = height
      
      self.leftChild?.parent = self
      self.rightChild?.parent = self
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
    
    var isLeftChild: Bool {
        return parent?.leftChild === self
    }
    
    var isRightChild: Bool {
        return parent?.rightChild === self
    }
    
    var hasLeftChild: Bool {
        return leftChild != nil
    }
    
    var hasRightChild: Bool {
        return rightChild != nil
    }
    
    var hasAnyChild: Bool {
        return rightChild != nil || leftChild != nil
    }
    
    var hasBothChildren: Bool {
        return rightChild != nil && leftChild != nil
    }
    
    public convenience init(key: Key, value: Element?) {
      self.init(key: key, value: value, leftChild: nil, rightChild: nil, parent: nil, height: 1)
    }
    
    public convenience init(key: Key) {
      self.init(key: key, value: nil)
    }
}

open class AVLTree<Key: Comparable, Element> {
    public typealias Node = AVLNode<Key, Element>
    
    fileprivate(set) var root: Node?
    fileprivate(set) var size: Int
    
    init(root: AVLTree<Key, Element>.Node?, size: Int) {
        self.root = root
        self.size = size
    }
}
