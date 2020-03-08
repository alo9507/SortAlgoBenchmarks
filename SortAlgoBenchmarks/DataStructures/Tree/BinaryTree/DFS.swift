//
//  DFS.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/*
 Given a binary tree and a number ‘S’
 Find if the tree has a path from root-to-leaf such that the sum of all the node values of that path equals ‘S’.
 */

extension BinaryNode where Element == Int {
    func hasSumPath(_ root: BinaryNode<Element>?, _ sum: Int) -> Bool {
        if (root == nil) {
            return false;
        }
        
        // if the current node is a leaf and its value is equal to the sum, we've found a path
        if (root!.value == sum && root!.leftChild == nil && root!.rightChild == nil) {
            return true;
        }
        
        // recursively call to traverse the left and right sub-tree
        // return true if any of the two recursive call return true
        return hasSumPath(root!.leftChild, sum - root!.value) || hasSumPath(root!.rightChild, sum - root!.value);
    }
}
