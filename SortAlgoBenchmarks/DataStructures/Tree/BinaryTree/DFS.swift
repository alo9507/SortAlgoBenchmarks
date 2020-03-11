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
    
    /*
     Given a binary tree and a number ‘S’
     Find all paths from root-to-leaf such that the sum of all the node values of each path equals ‘S’.
     */
    
    // Recursive Backtracking
    /*
     1) Is where I am a solution?
     2) No.  Ok, where can I go from here?  If I can go somewhere, choose a place to go.
     3) Go there.
     5) Was that a solution?  If yes, return true!
     5) If there are remaining places to go, choose one and goto #3.
     6) Out of places to go.  Return false.
     */
    
    // Outter function proxies recursive stack to other function, maintains state in its scope
    // Enumeration version of the Decision problem presented in hasSumPath
    func findPaths(
        _ root: BinaryNode<Element>?,
        _ sum: Int) -> [[Element]] {
        var allPaths: [[Element]] = Array(Array())
        var currentPath: [Element] = []
        findPathsRecursive(self, sum, &currentPath, &allPaths)
        return allPaths
    }
    
    func findPathsRecursive(
        _ node: BinaryNode<Element>?,
        _ sum: Int,
        _ currentPath: inout [Element],
        _ allPaths: inout [[Element]]) {
        // Base Case: Out of places to go
        guard let currentNode = node else { return }
        
        // add the current node to the path
        currentPath.append(currentNode.value)
        
        // Is where I am a solution?
        // If the current node is a leaf and its value is equal to sum, save the current path
        if (currentNode.value == sum && currentNode.leftChild == nil && currentNode.rightChild == nil) {
            allPaths.append(currentPath)
        } else {
            // Where can I go from here?, i.e. where can I recurse to
            
            // traverse left sub-tree
            findPathsRecursive(currentNode.leftChild, sum - currentNode.value, &currentPath, &allPaths)
            
            // traverse the right sub-tree
            findPathsRecursive(currentNode.rightChild, sum - currentNode.value, &currentPath, &allPaths)
        }
        
        // we only reach here when the path doesn't satisfy the sum constraint
        // remove the current node from the path to backtrack
        // in backtracking we attempt to solve a problem and if we don't reach the desired solution, then undo whatever we did for solving the subproblem, and try solving another subproblem
        // we need to remove the current node while we are going up the recursive call stack
        // this is how we "abandon the candidate"
        currentPath.remove(at: currentPath.count - 1)
    }
}
